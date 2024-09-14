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

This command reduces the framerate of your video by 50% and smoothly blends between the frames.

```sh
ffmpeg -i input.mp4 -vf "tblend=average,setpts=0.5*PTS" -r 25 -crf 2 -an output.mp4
```
