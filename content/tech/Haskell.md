---
title: "Notes on Haskell"
date: "2023-06-08"
draft: true
---

## Functions

All internal actions of the interpreter (functions that are not functions on any library) start with a `:`.

### First-class functions

Functions in Haskell are *first-class citizens*. You can use them just the way you use data: passing them as arguments, returning them from other functions, assigning them to variables, and testing them for equality.

There's also *second-class objects* – objects that don't fulfill the four criteria above.

### Side effects

Haskell is a *pure* programming language, which means it *seperates code with side effects from the actual business logic*. 

Side effects are *elements outside of the program control*, for example I/O, network communication, randomness etc. In programming languages there often is a global state that a program (or its methods / functions) interacts with or at least there are states outside of a function itself and *when the function depends on something other than its paramters*. Side effects occur when you interact with such an ›outside state‹. Such is also possible in Haskell; however, languages like Haskell force you to seperate pure functions (such w/o side effects) from impure functions (w/ side effects).

In Haskell, values cannot be reassigned.

## Data types and typeclasses

Types can be determined by invoking `:t` followed by the expression in question. This will return the expression followed by `::` (which reads as ›has type of‹) followed by the type.

Standard data types in Haskell are:
-  Lists (`[]`)
-  Booleans (`Bool`)
-  Characters (`Char`)
-  Strings (`String` or `[Char]`)
-  Tuples (`()`)
-  Unit (`()`)
-  Function Types
-  IO and IOError Types
-  `Maybe`, `Either`, `Ordering`

Further common types:
- Integers (`Int` (bounded) or `Integer` (no upper or lower boundary))
- exact rational numbers (`Ratio`)
- Floating point number with single precision (`Float`)
- Floating point number with double precision (`Double`)
- `Fractional`

For functions type declaration is done like so:
```haskell
someFunction :: Int -> Int -> Int -> Int
someFunction a b c = a + b + c
```
Here, the return type is the last item in the declaration and the parameters are all the items before the last one.

»Functions that have type variables are called polymorphic functions.« When running `:t` on such functions their type declaration (*type signature*) will contain type variables, which are written in lowercase letters, while types are written in uppercase.

Haskell's compiler (GHC) checks types *statically*. That means that all your expressions will be type checked before they are executed; there's no implicit type conversion as in dynamically typed languages. Haskell urges one towards *type-oriented programming*.

There's also *dependent typing*, which is an even stronger form of type checking.

### Lists 

Are arguably the most important data type in Haskell.

They are homogenous, meaning they cannot hold elements of different types.

### Conditions

In Haskell if-then-else statements look like this:
```haskell
if b then t else f 
``` 

In contrast to other languages like Javascript, there always has to be an else case.

Equality is checked with the `==` operator and inequality with `/=`.

### Type classes

Are similar to interfaces in OOP in that the determine the tipes of operations they permit their members.
[...]

### Parametricity

Parametricity refers to *parametric polymorphism*

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

### Recursion and iteration

»Recursion is [...] a way of defining functions in which the function is applied inside its own definition.«
»A recursive function is a function which calls back to itself with modified input values.« (source: [YLD](https://www.yld.io/blog/the-not-so-scary-guide-to-functional-programming/))

Recursive function depend on one or more *edge conditions*, which makes them terminate.

There are no iteration statements (like `for` loops) in Haskell, so recursion is important. Computations in Haskell are done »by declaring what something is instead of declaring how you get it.« What does that mean? [...]

Instead of iterating through a data structure, in Haskell you will use `map`. So in order to square a list of numbers, you could write:
```haskell
map (^2) [4, 8, 12]
``` 
Or:
```haskell
map (**2) [2.65, 5.53, 9.32]
``` 

Other recursive functions in Haskell are `filter`, high-order `fold` functions (`foldr`, `foldl`), `scanl` and `scanr`.

## Lazy evalution

Haskell's default evaluation model or execution strategy is built on *laziness*.

There's also libraries for parallel and concurrent execution of expressions, because the order of execution in Haskell doesn't strictly matter.
[...]

## Context wrapping

[...]

## Algebraic Data Types (ADT)

[...]

## Monads, Monoids, applicative functors, functors

### Context

[...]

### Functors

`fmap` or `<$>` (which is the infix variant of the former)

**Functors let you apply functions to a value wrapped in a context.**


### Applicative functors

**Applicatives let you apply functions wrapped in a context to a value wrapped in a context.**

`liftA` or `<*>`

### Monads

»Monads apply a function that returns a wrapped value to a wrapped value. Monads have a function `liftM` or `>>=` (pronounced ›bind‹) to do this.«

## Haskell ecosystem

The online repository for Haskell libraries are called *Hackage* and *Stackage*. 

Building and packaging tools for Haskell are *cabal* and *stack*.

The main installer for Haskell is *GHCUp*.

sources: 
- [Functional Programming by Example](https://caiorss.github.io/Functional-Programming/index.html) by Caio Rodrigues (2018)
- Learn You a Haskell for Great Good! A Beginner's Guide by Miran Lipovaca (2011, No Starch Press)
- Practical Haskell. A Real-World Guide to Functional Programming by Alejandro Serrano Mena (2022, Apress)