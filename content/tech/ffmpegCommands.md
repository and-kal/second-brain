---
title: "ffmpeg commands collection"
date: "2024-09-12"
draft: true
---

## Convert vertical to horizontal video with blurred sides

If you want to turn a vertical 9:16 video (like a YouTube short) into a 16:9 video with a blurred background instead of a black one, this is the command:

```sh
ffmpeg -i input.mp4 \
  -vf 'split[original][copy];[copy]scale=ih*16/9:-1,crop=h=iw*9/16,gblur=sigma=20[blurred];[blurred][original]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2' \
  output.mp4
```

([source](https://www.junian.net/tech/ffmpeg-vertical-video-blur/))

It tends to be kind of slow. So you might be better off creating it by hand in a video editing software if it's a longer video.

## Create an animated webp

Animated webp is more lightweight usually than a GIF. In order to create an animated webp from a GIF, run:

```sh
ffmpeg -f gif -i input.gif -c libwebp output.webp
```

Add `-loop 0`, if you want an infinitely looping webp.

You can create a lossless animated webp from a video with this command:

```sh
ffmpeg -i input.mp4 -vcodec libwebp -filter:v fps=fps=20 -lossless 1 -loop 0 -preset default -an -vsync 0 -s 800:600 output.webp
```

Or a lossy one like so:

```sh
ffmpeg -i input.mp4 -vcodec libwebp -filter:v fps=fps=20 -lossless 0  -compression_level 3 -q:v 70 -loop 1 -preset picture -an -fps_mode 0 -s 800:600 output.webp
```

([source](https://www.junian.net/tech/ffmpeg-vertical-video-blur/))

## Frame blending

This command reduces the framerate of your video by 50% and smoothly blends between the frames (untested).

```sh
ffmpeg -i input.mp4 -vf "tblend=average,setpts=0.5*PTS" -r 25 -crf 2 -an output.mp4
```

With this command you can reduce the speed of your video to a tenth and smoothly fade between the frames looks pretty good):

```sh
ffmpeg -i input.mp4 -vf "minterpolate=mi_mode=2,setpts=PTS*10" output.mp4
```

## GIF optimization

A quick way to make your GIFs smaller is:

```sh
ffmpeg -i input.gif -filter_complex "[0:v] fps=12,scale=-1:480,mpdecimate,split [a][b];[a] palettegen=max_colors=32 [p];[b][p] paletteuse=dither=bayer:bayer_scale=5" output.gif
```

## Extracting subtitles

If your movie has softcoded subtitles, you can easily extract them with ffmpeg as long as they are text-based: `ffmpeg -i movie.mkv -map 0:s:0 subs.srt`. This will select the 1st subtitle stream, if you want the second subtitles option, change `0:s:0` to `0:s:1`. In case you want to extract subtitles that are bitmap-based (like HDMV PGS of DVD subtitles), use the following command: `ffmpeg -i movie.mkv -map 0:s:0 -scodec copy subs.sup` (though VLC player might not be able to handle the `.sup`).

## Negative image mask

You can layer a PNG on top of a video and use the non-transparent parts of the image as a negative mask for the videos (for example if it's a PNG with some text, the video will be negative, where there's text) with this command:

```sh
ffmpeg -i input.mp4 -i overlay.png -filter_complex "[1:v]format=rgba,split[alpha][color]; [alpha]alphaextract[invert]; [color]negate[neg]; [neg][invert]alphamerge[final]; [0:v][final]overlay=format=auto" -c:v libx264 -pix_fmt yuv420p output.mp4
```

Note that the image shoudl have the same dimensions as the video.