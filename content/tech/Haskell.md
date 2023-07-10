---
title: "Notes on Haskell"
date: "2023-06-08"
draft: true
---

## Functions

All internal actions of the interpreter (functions that are not functions on any library) start with a `:`.

Functions in Haskell always start with a lowercase letters, same as parameters. Parameters are seperated only by spaces and are not enclosed in parantheses.

### First-class functions

Functions in Haskell are _first-class citizens_. You can use them just the way you use data: passing them as arguments, returning them from other functions, assigning them to variables, and testing them for equality.

There's also _second-class objects_ – objects that don't fulfill the four criteria above.

### Side effects

Haskell is a _pure_ programming language, which means it _seperates code with side effects from the actual business logic_.

Side effects are _elements outside of the program control_, for example I/O, network communication, randomness etc. In programming languages there often is a global state that a program (or its methods / functions) interacts with or at least there are states outside of a function itself and _when the function depends on something other than its paramters_. Side effects occur when you interact with such an ›outside state‹. Such is also possible in Haskell; however, languages like Haskell force you to seperate pure functions (such w/o side effects) from impure functions (w/ side effects).

In Haskell, values cannot be reassigned.

### Built-in functions

[...]

### Recursion and iteration

»Recursion is [...] a way of defining functions in which the function is applied inside its own definition.«
»A recursive function is a function which calls back to itself with modified input values.« (source: [YLD](https://www.yld.io/blog/the-not-so-scary-guide-to-functional-programming/))

Recursive function depend on one or more _edge conditions_, which makes them terminate.

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

### Operators

You can give your functions operators as a name. For example, `+++` is a valid name for a function. However, your custom operators must not start with a `:`.

### Infix operators

Infix operators like `+` also represent functions. For example, `:` prepends something to a list: `1 : 2 : []` returns `[1, 2]`. (There's no direct way to append elements to the end of a list though.)

### Bindings

The two kinds of binding constructs in Haskell are:

- `let ... in`
- `where`

## Data types and typeclasses

Types can be determined by invoking `:t` followed by the expression in question. This will return the expression followed by `::` (which reads as ›has type of‹) followed by the type.

Standard data types in Haskell are:

- Lists (`[]`)
- Booleans (`Bool`)
- Characters (`Char`)
- Strings (`String` or `[Char]`)
- Tuples (`()`)
- Unit (`()`)
- Function Types
- IO and IOError Types
- `Maybe`, `Either`, `Ordering`

Further common types:

- Integers (`Int` (bounded) or `Integer` (no upper or lower boundary))
- exact rational numbers (`Ratio`)
- Floating point number with single precision (`Float`)
- Floating point number with double precision (`Double`)
- `Fractional`


When defining types, constructors, type classes or kinds yourself they must start with an uppercase letter - or if you give them an operator name, that one should start with a `:`.

### Lists

Are arguably the most important data type in Haskell.

They are homogenous, meaning they cannot hold elements of different types.

### Tuples

»A tuple is [...] a type with a fixed number of components, each of them holding a value, not necessarily of the same type.«

#### Destructor functions

- `fst` gives the first component of a tuple
- `snd` gives the second component of a tuple

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

### Type signatures

For functions type declaration is done with the `::` operator:

```haskell
someFunction :: Int -> Int -> Int -> Int
someFunction a b c = a + b + c
```

Here, the return type is the last item in the declaration and the parameters are all the items before the last one.

If no types are specified, Haskell's interpreter will infer the type. **Type inference** is defined as »the automatic determination of the type of each expression based on the functions and syntax construct being used« (Serrano Mena, 2022).

Haskell's compiler (GHC) checks types _statically_. That means that all your expressions will be type checked before they are executed; there's **no implicit type conversion** as in dynamically typed languages. Haskell urges one towards _type-oriented programming_.

There's also _dependent typing_, which is an even stronger form of type checking.

#### Type variables

»Functions that have type variables are called polymorphic functions.« When running `:t` on such functions their type declaration (_type signature_) will contain type variables, which are written in lowercase letters, while types are written in uppercase.

### Parametricity

Parametricity refers to _parametric polymorphism_

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

## Syntax

### Parantheses

[...]

### Layout

Haskell uses a layout-based syntax. That means, »how a line is indented isn't as important as the fact that all elements in the same block start in the same column. [E.g.] in an `if` block, the lines for `then` and `else` must be indented the same way.«

## Lazy evalution

Haskell's default evaluation model or execution strategy is built on _laziness_.

There's also libraries for parallel and concurrent execution of expressions, because the order of execution in Haskell doesn't strictly matter.
[...]

## Context wrapping

[...]

## Algebraic Data Types (ADT)

Instead of OOP-tyle classes, in Haskell you will use data types. One common data type are ADTs. ADTs are defined by two sorts of data:

- »A name for the type that will be used to represent its values.«
- »A set of constructors that will be used to create new values. These constructors may have arguments that hold values of the specified types.«

```haskell
data NameOfDataType = NameOfConstructorOne String
                    | NameOfConstructorTwo String Integer
                    | NameOfConstructorTree String String Bool
                    deriving Show
```

`deriving Show` is optional. It's used so that you can print the values without having to write a custom function for that (*automatic deriving*). The names of constructors must be unique inside a module.

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

## The Interpreter

Loading files into the interpreter is done with the `:l` command followed by the path to the file.

## Haskell ecosystem

Building and packaging tools for Haskell are _cabal_ and _stack_.

The online repository for Haskell libraries are called _Hackage_ (for _cabal_) and _Stackage_ (for _stack_).

The main installer for Haskell is _GHCUp_.

sources:

- [Functional Programming by Example](https://caiorss.github.io/Functional-Programming/index.html) by Caio Rodrigues (2018)
- Learn You a Haskell for Great Good! A Beginner's Guide by Miran Lipovaca (2011, No Starch Press)
- Practical Haskell. A Real-World Guide to Functional Programming by Alejandro Serrano Mena (2022, Apress)
