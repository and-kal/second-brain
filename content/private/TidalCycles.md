---
title: "How I Use TidalCycles"
date: "2024-09-24"
draft: true
---

One code pattern I'm using hardcore since I discovered it in one of [Mike Hodnick's videos](https://www.youtube.com/user/kindohm) goes like this:

```haskell
d1 $ n (unwrap $ fmap (["~", "0", "3", "7"]!!) $ "[0 1 2 3 0 1 2 3]")
# s "midi" # midichan 9
```

This one will effectively replace the indexes in your mini-notation with what you have in the provided list at the given index. The syntax here is pretty arcane, so I'm trying to make some sense out of it:

- `!!` is used for indexing a list (check [this example](https://jonathanmann.github.io/2015/02/07/memoization-with-lazy-evalutation-in-haskell/) for an explanation)
- `unwrap` is a function defined in TidalCycles (`Sound.Tidal.Core`) and is only necessary here when using rests (`~`); apparently, `unwrap` converts a pattern of patterns back into regular pattern
  ...

<!--
The previous code could actually be re-wrtten as:
```haskell
d1 $ n (unwrap $ fit 0 ["~", "0", "3", "7"] "[0 1 2 3 0 1 2 3]")
# s "midi" # midichan 9
```
 -->

<!--
```haskell
mike notes pattern = note (unwrap $ fmap (x) $ pattern)
```
-->
