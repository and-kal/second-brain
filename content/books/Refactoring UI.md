---
title: "Refactoring UI by Steve Schoger & Adam Wathan (2018)"
date: "2023-03-17"
---

Some takeaways from the *Refactoring UI* book:

#### Limit your choices

Create a pool to choose from beforehand, e.g.
    - a color pallette plus shades 
    - a list of possible font-sizes
    - a list of margins and paddings to choose from

#### Emphasis by de-emphasizing

Try emphasizing by de-emphasizing!

Instead of having many element competing with each other for emphasis, try to de-emphasize some elements.
- You can give inactive elements a lighter shade of the same color. 
- However, using opacity for that can have some pitfalls, it's usually better to use the "L" value in HSL colours. 
    - There's [a SASS function for that](https://sass-lang.com/documentation/modules#hsl).

"[R]educing contrast helps to de-emphasize heavy elements, increasing weight is a great way to add a bit of emphasis to low contrast elements."

#### Labels

Labels don't always need to be treated as headlines. They might just be there to support and clarify, while the associated data is what speaks. If that's the case "[d]e-emphasize the label by making it smaller, reducing the contrast, using a lighter font weight".

But don't do that in cases where users might be skimming for a label or depend on the label.

Contrast between label and data can be achieved simply by lighter or darker colors or bold and regular font-weights.

##### Headlines

Headlines from <h1> to <h6> don't necessarily need to decrease in font-size progessively. Just like labels, sometimes headlines are just supportive content and shouldn't draw so much attention.

For a11y reasons, one shouldn't mix order from <h1> to <h6>. However, when the headlines don't need to be displayed (because the content speaks for itself) they can be hidden, e.g. with `display: none`.

#### Hierarchy 

Hierarchy is oftentimes determined by how much surface area some element inhabits. So, font size, font weight etc. matter. 

However, contrast also matters and can create hierarchy. Instead of using weights, one can use color softness in order to achieve hierarchy.

When designing buttons, think of the *hierarchy of actions*:
- "Primary actions should be obvious"
- "Secondary actions should be clear but not prominent"
- "Tertiary actions should be discoverable but unobtrusive"

Depending on where the user currently is in the UX (e.g. in an ordering process) the hierarchy of actions can change.

Don't rely on contrasting colors so much in order to attain hierarchy as many different colors tend to make the UI too busy.

#### Spacing

> "Start with too much white space". 

Instead of adding margins and paddings, try to have too much padding/margin in the beginning and then start removing some (which is also easier and more obvious to do).

> A spacing and sizing system will help you create better designs, with less
effort, in less time

Define a set of values for spacings in advance.
It's best to work with relative values here (percentages) instead of absolute ones (pixels).

> If you want your system to make sizing decisions easy, make sure no two
values in your scale are ever closer than about 25%.

> You don’t have to fill the whole screen

And not everything needs to be full-width. Give elements just the space they need.

> If you’re building a responsive web application, try starting with a ~400px canvas and designing the mobile layout first.