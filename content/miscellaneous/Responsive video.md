---
title: "Making a video responsive in CSS"
date: "2023-03-28"
draft: true
---

Sometimes you don't give much thought to basic UX/UI things until you have to implement them yourself. Like the other day I wanted to put a video on a webpage that, upon resizing the window, behaves like a video in VLC Player would. That is, it would always take the full width or full height of the window, depending on the aspect ratio of the video and the window's height and width. So, either the video would take the whole width of the window and have black bars above and below it when the window height is greater than the video's height, or it would take the whole height of the window and have those black bars left and right of the video when the window width is greater than the video's width. 

It seemed quite trivial, but I couldn't come up with a good solution in pure CSS that worked reliably. Crazy enough, I've never heard of [vmin and vmax](https://thenewcode.com/1137/MinMaxing-Understanding-vMin-and-vMax-in-CSS) in CSS before.