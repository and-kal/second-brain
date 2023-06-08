---
title: "Learn You a Haskell for Great Good! A Beginner's Guide by Miran Lipovaca (2011, No Starch Press)"
date: "2023-06-08"
draft: true
---

## Data types and typeclasses

Types can be determined by invoking `:t` followed by the expression in question. This will return the expression followed by `::` (which reads as ›has type of‹) followed by the type.

Standard data types in Haskell are:
-  Booleans (`Bool`)
-  Characters (`Char`)
-  Strings (`String` or `[Char]`)
-  Lists (`[]`)
-  Tuples (`()`)
-  Unit (`()`)
-  Function Types
-  IO and IOError Types
-  `Maybe`, `Either`, `Ordering`

Further common types:
- Integers (`Int`)
- Floating point number with single precision (`Float`)
- Floating point number with double precision (`Double`)

For functions type declaration is done like so:
```haskell
someFunction :: Int -> Int -> Int -> Int
someFunction a b c = a + b + c
```
Here, the return type is the last item in the declaration and the parameters are all the items before the last one.

»Functions that have type variables are called polymorphic functions.« When running `:t` on such functions their type declaration (*type signature*) will contain type variables, which are written in lowercase letters, while types are written in uppercase.

### Typeclasses

[...]

### Type annotations

In order to xplicitely say, which type an expression is supposed to have, we can use the `::` operator at the end of an expression followed by the desired type:

```haskell
[...]
```

### Class constraints

Are denoted with the `=>` symbol. 

```haskell
(==) :: (Eq a) => a -> a -> Bool
```

This says that the two `a` values must be of the `Eq` class

## Built-in functions

[...]

## Recursion

»Recursion is [...] ]a way of defining functions in which the function is applied inside its own definition.«

Recursive function depend on one or more *edge conditions*, which makes them terminate.

There are no iteration statements (like `for` loops) in Haskell, so recursion is important. Coputations in Haskell are done »by declaring what something is instead of declaring how you get it.« What does that mean? [...]

