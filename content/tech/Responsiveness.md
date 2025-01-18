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

However, having to load multiple CSS files seperately can ultimately make your page slower and is usually not recommended. Read [this article by  Ilya Grigorik](https://web.dev/critical-rendering-path-render-blocking-css/) for some more information.

### Pointers

With Media Queries Level 5 the [pointer media feature](https://www.w3.org/TR/mediaqueries-5/#pointer) was introduced, which lets you differentiate between the primary input type of a given device. It would looks like this:

```css
@media (pointer: coarse) {
/* styles for coarse pointer device, typically a mouse */
}
@media (pointer: fine) {
/* styles for fine pointer device, typically a finger */
}
``` 

While there might be some use cases for this, it's usually a good practice to style everything with a coarse pointer (like a finger) in mind. For example, give a button enough padding and make sure the `onClick` event is not only, say, on the text of a button, but on the whole element including its padding, too, so that users can be a bit off the center of an element when they tap and still trigger the click event.

### Dark mode

OSs and browsers these days allow users to have dark mode as the preferred default in their user settings. [...]

```scss
$primary: #e4e4e4;
$secondary: #545454;

@media (prefers-color-scheme: dark) {
  $primary: #545454;
  $secondary: #e4e4e4;
}
```

## sources 

- Ben Frain: (Enduring CSS. Architect and maintain large-scale CSS codebases)[(https://ecss.benfrain.com/) (2016)
- Ben Frain: Responsive Web Design with HTML5 and CSS, 4th Edition (Packt Publishing, 2022)