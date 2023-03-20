---
title: "Refactoring UI by Steve Schoger & Adam Wathan (2018)"
date: "2023-03-17"
---

Some takeaways from the *Refactoring UI* book:

##### Limit your choices

Create a pool to choose from beforehand, e.g.
    - a color pallette plus shades 
    - a list of possible font-sizes
    - a list of margins and paddings to choose from

##### Emphasizing by de-emphasizing

Instead of having many element competing with each other for emphasis, try to de-emphasize some elements.
- You can give inactive elements a lighter shade of the same color. 
- However, using opacity for that can have some pitfalls, it's usually better to use the "L" value in HSL colours. 
    - There's [a SASS function for that](https://sass-lang.com/documentation/modules#hsl).