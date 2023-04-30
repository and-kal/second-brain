---
title: "Refactoring UI by Steve Schoger & Adam Wathan (2018)"
date: "2023-03-17"
---

Some takeaways from the *Refactoring UI* book:

## Limit your choices

Create a pool to choose from beforehand, e.g.
    - a color pallette plus shades 
    - a list of possible font-sizes
    - a list of margins and paddings to choose from

When working with sizes, *don't use linear scaling*. I.e. your pool of font sizes should not be a certain number of font sizes that are each 4px apart, but rather work with a base font size and ratios like 0.25, 0.5, 1, 2, 3, 4, etc. 

## Emphasis by de-emphasizing

**Try emphasizing by de-emphasizing.**

Instead of having many element competing with each other for emphasis, try to de-emphasize some elements.
- You can give inactive elements a lighter shade of the same color. 
- However, using opacity for that can have some pitfalls, it's usually better to use the "L" value in HSL colours. 
    - There's [a SASS function for that](https://sass-lang.com/documentation/modules#hsl).

"[R]educing contrast helps to de-emphasize heavy elements, increasing weight is a great way to add a bit of emphasis to low contrast elements."

## Labels

Labels don't always need to be treated as headlines. They might just be there to support and clarify, while the associated data is what speaks. If that's the case "[d]e-emphasize the label by making it smaller, reducing the contrast, using a lighter font weight".

But don't do that in cases where users might be skimming for a label or depend on the label.

Contrast between label and data can be achieved simply by lighter or darker colors or bold and regular font-weights.

### Headlines

Headlines from `<h1>` to `<h6>` don't necessarily need to decrease in font-size progessively. Just like labels, sometimes headlines are just supportive content and shouldn't draw so much attention.

For a11y reasons, one shouldn't mix order from `<h1>` to `<h6>`. However, when the headlines don't need to be displayed (because the content speaks for itself) they can be hidden, e.g. with `display: none`.

## Hierarchy 

Hierarchy is oftentimes determined by how much surface area some element inhabits. So, font size, font weight etc. matter. 

However, contrast also matters and can create hierarchy. Instead of using weights, one can use color softness in order to achieve hierarchy.

When designing buttons, think of the *hierarchy of actions*:
- "Primary actions should be obvious"
- "Secondary actions should be clear but not prominent"
- "Tertiary actions should be discoverable but unobtrusive"

Depending on where the user currently is in the UX (e.g. in an ordering process) the hierarchy of actions can change.

Don't rely on contrasting colors so much in order to attain hierarchy as many different colors tend to make the UI too busy.

## Spacing

> Start with too much white space. 

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

## Layout

Even tough, grid systems like Bootstrap's 12 column grid, are useful and efficient, not all layout decisions should be based on grid systems. At least not on fixed grids (grids with equal distribution).

Some elements might have *optimal sizes* and can be given fixed sizes. Like a header that should always be 100px high.

Relative proportions aren't necessarily the same on all screens. For example, if a heading's font size is twice the size of the content on desktop, this 1:2 kind of proportion will probably look to extreme on mobile screens. Same for inner proportions, like font-size and padding on button elements.

> As a general rule, elements that are large on large screens need to shrink faster than elements that are already fairly small — the difference between small elements and large elements should be less extreme at small screen sizes.

Take care of horizontal and vertical spacing in order to group content and make the relationships between elements easy to understand. (You can also use borders and dividers.)

## Typeset

**Define a type system beforehand.**

It's okay to handpick a list of type scales in pixel or rem values and use that. It doesn't need to be a scale based on maths and complex ratios.

Make sure not to use em values in your type scale since this can easily break your type scale system when working with nested elements.

In doubt or as a fallback, you can always use the default font stack of your operating system:
`-apple-system, Segoe UI, Roboto, Noto Sans, Ubuntu, Cantarell, Helvetica Neue;`

> Fonts meant for headlines usually have tighter letter-spacing and shorter lowercase letters (a shorter x-height), while fonts meant for smaller sizes have wider letter-spacing and taller lowercase letters.

Make sure not to have paragraphs too narrow or too wide. Usually, 45 to 75 characters per line is a good choice. Giving your paragraph a width of something between 20 and 35em will do the job.

Centering text items vertically (e.g. with `align-items: center`) will work when the items' sizes don't differ much. But when they're sizes are further apart from each other, it will look wonky. Centering to baseline (`align-items: baseline`) is usually cleaner.

> [Y]our line-height and paragraph width should be proportional — narrow content can use a shorter line-height like 1.5, but wide content might need a line-height as tall as 2. [...] When text is small, extra line spacing is important because it makes it a lot easier for your eyes to find the next line when the text wraps.

> Line-height and font size are inversely proportional — use a taller line-height for small text and a shorter line-height for large text.

Hyperlink don't always need to stand out. It depends on the context, if you should hihlight a link (by coloring them or by underlining on hover vel sim.).

**Don't center align long text blocks.** Use center-alignment for headlines, or short independent text blocks. Otherwise use left-alignment (or right-alignment in Hebrew, Persian etc.). Numbers in tables should be right-aligned (so that decimal seperators are in place).

> [W]henever you justify text, you should also enable hyphenation

You don't normally need to tweak letter-spacing. 

Only when you want to use a font that is used for normal text as a font for your headline, you should consider tightening the letter spacing a bit. Or when using uppercase letters only, adding a bit of letter spacing is a good idea w/r/t readability.

## Colors

**Consider using HSL instead of RGB and HEX** (see above). 

(HSL = Hue Saturation Lightness) != (HSB = Hue Saturation Brightness)

A good color palette consists of three categories: *grays, primary color(s) and accent color(s)*.

Shades are important. For each color hue you use, you'll need 5-10 shades of it.

In color palettes it's okay to use linear increments. For example, for shades of gray, you can simply use something like: hsl(0, 0%, 5%), hsl(0, 0%, 15%), hsl(0, 0%, 25%), etc. (Or use a tool like [Micro Digital Tools' Color Shades Generator](https://mdigi.tools/color-shades).)

However, it's always good to judge by how something looks, more than mathematical relations. (You can tweak some parameters of each color/shade afterwards of course.)

The primary color or the primary colors should your defining color(s). You will also need a handful of shades of that color.

Accent colors are used to highlight and emphasize things and communicate certain states. (What is `success`,  `danger`, `warning`, `info` in Bootstrap.) These colors should be used far less than the primary colors.

When creating palettes of shades it's a good idea to start with the middle color and then find the lightest and the darkest shade and then interpolate for the shades in between.

For lighter shades of a color it's advisable to add some saturation in order to not have them look too pale. You can also try *to rotate the hue*. So instead of increasing the L value in HSL, try to move the H value towards the nearest bright hue (i.e. 60°,
180°, or 300°). Coversely, to make it look darker, move the H value towards the nearest dark hue (0°, 120°, or 240°). Changing hue and changing lightness can also be combined in order to arrive at a well-balanced colour palette.

> Don’t rotate the hue more than 20-30° or it will look like a totally different color instead of just lighter or darker.

**Greys** by definition have a saturation of 0 (so chaging the hue won't change the grey). In order to get more interesting pseudo-grey colours, add some saturation to them. 

> If you want your greys to feel cool, saturate them with a bit of blue [...] To give your greys a warmer feel, saturate them with a bit of yellow or orange.

## Accessibility ('a11y')

Many guiding rules are defined by the *Web Content Accessibility Guidelines*.

Colur shouldn't be the only source of meaning or means of conveying information, because people with colour blindness might not be able to grasp the informartion. So also use additional icons or something. If that's not an option, create contrasts, so even colour blind people can discern the elements. 

> Always use color to support something that your design is already saying; never use it as the only means of communication.

### Font size

> [N]ormal text (under ~18px) has a contrast ratio of at least 4.5:1, and [...]] larger text has a contrast ratio of at least 3.

### Contrasts 

In order to achieve contrast between text and background, you don't always need to darken to background when using light text for example. 

> Instead of using light text on a dark colored background, use dark colored text on a light colored background.

In case of dark coloured backgrounds, changing lightness and saturation in order to get a text color with a good contrast can result in a color that is almost white. Changing the hue towards cyan, yellow, or magenta will produce better results.

<!-- 
## Depth / Shadows

> Small shadows with a tight blur radius make an element feel only slightly raised off of the background, while larger shadows with a higher blur radius make an element feel much closer to the user. The closer something feels to the user, the more it will attract their focus. 

Establish an elevation system, i.e. a hierarchy of elements and components in terms of how close they appear (for example modal to dropdown menu to button)

-->