---
title: "SvelteKit: Using the YouTube iframe Player API"
date: "2023-04-30"
draft: false
---

The other day I tried to use YouTube iframe Player API in order to have a section of a YouTube video play in a loop on a
website I build. Usually I would just embed the video directly with the link and the parameters appended like so:

```html
<iframe
  width="1280"
  height="720"
  src="https://www.youtube.com/embed/kdMG40wUCm4?autoplay=1&loop=1&autoplay=1&playlist=kdMG40wUCm4"
  frameborder="0"
></iframe>
```

However, this won't let you loop only a portion of the video as it will always start the video at 0:00. In order to really have only a couple of seconds from the middle of a video play in a loop, you can't avoid the [YouTube iframe Player API](https://developers.google.com/youtube/iframe_api_reference). If you ever worked with that API you might have noticed that it's pretty outdated (pre-ES6 days) and not really made with modern frameworks in mind. So it took me a bit of tinkering around in order to translate the examples from the official YouTube docs to SvelteKit. But I eventually came up with a solution that worked.

The component looks as follows and you'll need to call it with the respective YoutTube video id as a prop; like so: `<Video id={'kdMG40wUCm4'} />`.

```javascript
<script>
	import { onMount } from 'svelte';

	export let id;

    let player;

	onMount(() => {
		function onYouTubeIframeAPIReady() {
			player = new YT.Player(id, {
				// width: 1280,
				// height: 720,
				videoId: id,
				playerVars: {
					start: 50,
					end: 70,
                    // Auto-play the video on load
					autoplay: 1,
                    // Hide video controls when playing
					autohide: 1,
                    // Hide pause/play buttons in player
					controls: 0,
					disablekb: 1,
					enablejsapi: 1,
                    // Hide the full screen button
					fs: 0,
                    // Run the video in a loop
					loop: 1,
                    // Hide the Youtube Logo
					modestbranding: 1,
					rel: 0,
                    // Hide the video title
					showinfo: 0,
                    // Hide closed captions
					cc_load_policy: 0,
                    // Hide the Video Annotations
					iv_load_policy: 3
				},
				events: {
					onReady: onPlayerReady,
					onStateChange: onPlayerStateChange
				}
			});
		}

		onYouTubeIframeAPIReady();

		function onPlayerStateChange(state) {
			if (state.data === 0) {
				player.loadVideoById({
					videoId: id,
					startSeconds: 50,
					endSeconds: 70
				});
			}
		}

		function onPlayerReady(event) {
			player.seekTo(50);
			player.mute();
			player.playVideo();
		}
	});
</script>

<svelte:head>
	<script src="https://www.youtube.com/iframe_api">
	</script>
</svelte:head>

<div class="container">
	<div id={id} />
</div>

<style lang='scss'>
	.container {
		// use '*' instead of 'div',
		// because the onYouTubeIframeAPIReady function
		// will replace that 'div' with the 'iframe'
		>*:first-child {
			width: 300%;
			margin-left: -100%;
			height: 100%;
			object-position: center center;
			pointer-events: none; // prevent displaying video title etc. on hover
		}
	}
</style>
```

Three things you should note here:

- There's a bunch of [player parameters](https://developers.google.com/youtube/player_parameters.html?playerVersion=HTML5&hl=de) you can set in order to hide video info, controls etc. from the video and have the video autostart on mute. Unfortunately, the `showinfo` parameter has been deprecated in 2018 (same as `rel`), so you'll always have the YouTube logo and the video title displayed, no matter what. There's a [little CSS hack by adamgreenough on Codepen](https://codepen.io/adamgreenough/pen/bGrgoNb) though that gets rid of the logo and the title. I utilized that in my example, along with setting `pointer-events` to `none` (so that hovering over the video won't trigger the video title being displayed either).
- I use the `id` in order to identify the YouTube video I want to play, but also in order to reference the `div` which will be transformed into an `iframe` via the `new YT.Player(id)` instantiation. This allows me to use multiple videos in a page with the YouTube ID as the unique id. But you could also give the `div` a different id property and use that as parameter when instantiating the `YT.Player` object.
- One thing I noticed is that the `YT.Player` object only gets instantiated on first mount. So when I navigate back and forth between routes, the second time I visit the route with the video, the player won't actually load. Thus, make sure to give the `container` element some background image, which will function as a fallback in case the video is not displaying.
