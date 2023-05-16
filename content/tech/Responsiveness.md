---
title: "Lesser known strategies for making stuff responsive in HTML5 and CSS3"
date: "2023-03-28"
draft: true
---

Sometimes you don't give much thought to basic UX/UI things until you have to implement them yourself. Like the other day I wanted to put a video on a webpage that, upon resizing the window, behaves like a video in VLC Player would. That is, it would always take the full width or full height of the window, depending on the aspect ratio of the video and the window's height and width. So, either the video would take the whole width of the window and have black bars above and below it when the window height is greater than the video's height, or it would take the whole height of the window and have those black bars left and right of the video when the window width is greater than the video's width.

It seemed quite trivial, but I couldn't come up with a good solution in pure CSS that worked reliably. Crazy enough, I've never heard of [vmin and vmax](https://thenewcode.com/1137/MinMaxing-Understanding-vMin-and-vMax-in-CSS) in CSS before.

Another useful snippet is this media query here, which checks if the client's browser window is landscape or portrait

```css
.content {
  width: 100vh;
}

@media screen and (min-width: 100vh) {
  /* The width is greater than the height */
  .content {
    width: 100vw;
  }
}

/* That's basically the same as: */

@media (orientation: portrait) {
  .content {
    width: 100vh;
  }
}

@media (orientation: landscape) {
  .content {
    width: 100vw;
  }
}
```

It's even possible to load different .css files depending on the orientation of the client's device / browser:

```html
<link rel="stylesheet" media="screen and (orientation: portrait)" href="portrait.css" />
<link rel="stylesheet" media="screen and (orientation: landscape)" href="landscape.css" />
```

Or inside of another CSS oder Sass file it'd be:
```css
@import url("portrait.css") screen and (orientation: portrait);
@import url("landscape.css") screen and (orientation: landscape);
```
