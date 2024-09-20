---
title: "Notes on Haskell"
date: "2023-06-08"
draft: true
---

## Functions

All internal actions of the interpreter (functions that are not functions on any library) start with a `:`.

**Functions** in Haskell always **start with a lowercase letters, same as parameters and bindings**. Parameters are seperated only by spaces and are not enclosed in parantheses.

### First-class and higher order functions

Functions in Haskell are _first-class citizens_. You can use them just the way you use data: passing them as arguments, returning them from other functions, assigning them to variables, and testing them for equality. If a function does any of these things, it's said to be a _high order function_.

There's also _second-class objects_ – objects that don't fulfill the four criteria above.

#### _map_, _filter_, _reduce_

<!-- TODO:
[...]
-->

`takeWhile` takes a predicate and a list, goes through the list and returns the list's elements as long as the predicate is true. That means that `takeWhile` works on infinite lists, which `filter` doesn't. The inverted version of `takeWhile` is called `dropWhile` by the way. `span` and `break` return two list: one list with the values taken and one with the values dropped.

### Currying, lambda calculus, etc.

»Every function in Haskell officially only takes one parameter. [...] That's why the return type and the parameters of functions are all simply separated with arrows.« (Lipovaca, 2011)

The Lambda Calculus as invented by Alonzo Church has three elements: _functions_, _variables_, and _applications_. Evaluation or ›a computational step‹ is done via ›β-reduction‹, where we replace the variables of a function body with the provided argument.

```haskell
identity x = x
identity 666 -- reduces to: 666 = 666
```

Lambda Calculus only supports functions with one parameter/argument. In order to have multiple parameters, you would use a technique called **currying** which allows partial application:

```haskell
multThree x y z = x * y * z
multThree 2 3 4
-- is the same as...
((multThree 2) 3) 4
```

Behind the scenes, every function in Haskell, too, only takes one parameter and either returns a value, or returns a partially applied function, which either returns a value or again returns a partially applied function - depending on the number of arguments.

»Generally, if you have a function like `foo a = bar b` a, you can rewrite it as `foo = bar b`, because of currying.« (Lipovaca, p. 54)

Anonymous functions (or _lambda abstractions_) in Haskell are written like so:

```haskell
let someFunction = \(x, y) -> (subtract (y ** 2) x)
in map someFunction [(1,5),(2,5),(3,5)]
```

You can also use anonymous function _on-the-fly_ without the `let` keyword, as you can see in this example (from the Lipovaca book):

```haskell
numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
```

With `\xs` we declare `xs` as the parameter of our lambda expression. If we had more than one paramtere, we would just seperate them by spaces, like `\xs ys zs -> ...`.

As for pattern matching, you can also do that in lambda functions, but you can only define one pattern. If you wanted to use several pattern definitions, you should maybe write an abstraction, instead of using an anonymous lambda functions.

Is there a way to write recursive lamda abstractions? Since these functions are nameless and anonymous, there's no way for them to refer to themselves, so that recursion is not possible.

### Function application

Function application in Haskell can be done simply by putting a space between two things. If you want to apply the result of one function to another function, you would put the former in parantheses:
`sum (map (* 7) [5,6,7,8])`. However, there's also the `$` operator, which does almost the same, but has the lowest precedence of all operators and so it will be executed last, which means that you don't need parantheses, but could write `sum $ map (* 7) [5,6,7,8]`. Function application is a function just like any other, so you can also apply it to other functions: `map ($ 2) [sqrt, sqrt . sqrt]`. Note that we use the function composition operator `.` here. Both, `.` and `$`, are right-associative. Thus,:{} `f (g (z x))` is the same as `f $ g $ z x`, which is the same as `(f . g . z) x`.

Function composition also allows for so-called ›point-free style‹ when writing functions, where the funtions' arguments/parameters are omitted. A classic example is `sum = foldr (+) 0`. (This is also called [tacit programming](https://en.wikipedia.org/wiki/Tacit_programming). The term _point_ here refers to the function parameters, which are called _points_ in mathematics.)

### Side effects

Haskell is a _pure_ programming language, which means it _seperates code with side effects from the actual business logic_.

Side effects are _elements outside of the program control_, for example I/O, network communication, randomness etc. In programming languages there often is a global state that a program (or its methods / functions) interacts with or at least there are states outside of a function itself and _when the function depends on something other than its paramters_. Side effects occur when you interact with such an ›outside state‹. Such is also possible in Haskell; however, languages like Haskell force you to seperate pure functions (such w/o side effects) from impure functions (w/ side effects).

In Haskell, values cannot be reassigned.

### Useful functions and modules

Functions and types that have a similar purpose can be bundled into module. You can create your own modules with the `module` keyword followed by a name and the functions (and types) it exports and a `where` statement. See for example the [TidalCycles core module](https://hackage.haskell.org/package/tidal-1.9.4/docs/src/Sound.Tidal.Core.html). There will also be cases where you don't want to export all functions you defined, because are only helper functions. In that case, put the functions to be exported in parantheses before the `where` as in the [Paths_tidal module](https://hackage.haskell.org/package/tidal-1.9.4/docs/src/Paths_tidal.html#version).

If you only want to import specific function definitions from a module put those in parantheses like `import Data.List (permutations)`; and if you want to import all definitions except certain ones use `hiding`: `import Data.List hiding (head, tail)`

#### `Debug.Trace`

The standard library for [debugging in Haskell](https://en.wikibooks.org/wiki/Haskell/Debugging) is `Debug.Trace` and it's loaded by default. Check [this article by Rebecca Skinner](https://medium.com/pragmatic-programmers/pure-print-style-debugging-in-haskell-c4c5d4f39afa) for some more in-depth information on logging and debugging in Haskell.

#### `Data.List`

`Data.List` is module with many useful list manipulation and analysis functions. For example `nub` (meaning »essence«) removes duplicate elements from a list:

```haskell
import Data.List (nub)

length $ nub [0,1,2,0,1,2,0,1,2,3]
-- returns 4
```

`find` takes a condition and a list and returns the first element that fulfills the condition (as an [ADT](#algebraic-data-types-adt)).

```haskell
import Data.List

find :: (a -> Bool) -> [a] -> Maybe a
find (\val -> val `mod` 3 == 0) [2,45,99]

-- returns Just 45
```

Note that, if you want to supply your own equality function (as we just did with `find`), but for `nub`, `delete`, `union`, `intersect` and `group`, you would have their respective `nubBy`, `deleteBy`, `unionBy`, `intersectBy` or `groupBy` counterparts.

There's many more useful list-related functions in `Data.List`, e.g.: `intersperse`, `intercalcate`, `concat`, `isPrefixOf`, `isSuffixOf`, `isInfixOf`, `elemIndex`, `findIndex`, `lines`, `words`, `\\` (list difference function), `!!`, `insert` and the several `permutations` functions.

<!--
#### `Data.Function`

`on`
-->

#### `Data.Char`

This module provides a set of function for mapping over lists of characters (aka. strings).

It also exports functions like `ord` and `chr`, which let you convert characters to their numeric Unicode values and vice versa.

The documentation for `Data.Char` can be found [here](https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-Char.html).

#### `Data.Map`

This module deals with ordered maps where values are associated with keys (like dictionaries in other programming languages).

Some functions in `Data.Map` have the same name as functions from `Prelude` and `Data.List`. In order to avoid conflicts, you need to use a qualified import:

```haskell
import qualified Data.Map as Map
```

You can now use the functions from this module, by writing `Map.` followed by the name of the function.

The documentation for `Data.Map` can be found [here](https://hackage.haskell.org/package/containers-0.4.0.0/docs/Data-Map.html).

#### `Data.Set`

Sets are similar to lists and maps, but they are implemented so that they will contain no duplicate elements and that their elements are ordered.

Some of `Data.Set`s functions are
`fromList`, `toList` `intersection`, `difference`, `union`, `null`, `size`, `member`, `empty`, `singleton`, `insert`, `delete`, `isSubsetOf` and of course their own `filter` and `map`.

#### `id`

`id` is the identity funtion in Haskell: »In functional languages, functions are first class values that you can pass as a parameter. So one of the most common uses of `id` comes up when you pass a function as a parameter to another function to tell it what to do. One of the choices of what to do is likely to be "just leave it alone" - in that case, you pass id as the parameter.« ([source](https://stackoverflow.com/a/3136407/20232056))

<!-- [tbc.] -->

### Recursion and iteration

»Recursion is [...] a way of defining functions in which the function is applied inside its own definition.«
»A recursive function is a function which calls back to itself with modified input values.« (source: [YLD](https://www.yld.io/blog/the-not-so-scary-guide-to-functional-programming/))

Recursive function depend on one or more _edge conditions_, which makes them terminate.

Let's take this example from »Learn You a Haskell for Great Good!«:

```haskell
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0 = []
    take' _ [] = []
    take' n (x:xs) = x : take' (n-1) xs
```

In the last line, we're destructuring the second parameter, which is a list, by means of pattern matching. Then we take the first element from the list, `x`, and with `:` we create a new list with `take' (n-1) xs` appended. That means `take'` is called again, but with the first parameter `n` that we gave reduced by one. So if we had called `take' 3 [3, 6, 9, 12, 15]`, the last line would come down to

```
take' 3 (3:[3, 6, 9, 12, 15]) = 3 : take' 2 [6, 9, 12, 15]
```

then to

```
take' 2 (6:[9, 12, 15]) = 3:6:take' 1 [9, 12, 15]
```

then to

```
take' 1 (9:[12, 15]) = 3:6:9:take' 0 [12, 15]
```

and eventually to

```
take' 0 (12:[15]) = 3:6:9:[]
```

which means we now have the first three elements of our initial list as a new list.

There are no iteration statements (like `for` loops) in Haskell, so recursion is important. Computations in Haskell are done »by declaring what something is instead of declaring how you get it.« What does that mean? [...]

Instead of iterating through a data structure, in Haskell you will use `map`. So in order to square a list of numbers, you could write:

```haskell
map (^2) [4, 8, 12]
```

Or:

```haskell
map (**2) [2.65, 5.53, 9.32]
```

Other recursive functions in Haskell are `filter`, high-order `fold` functions, `scanl` and `scanr`.

### Folds and scans

›Folds‹ in Haskell are functions that reduce a list to a singular value. Folds take a function, a starting value (just like the accumulator in `reduce`) and the list we want to apply the function on.

To get the product of all items from a list, we can use a left fold:

```haskell
product :: (Num a) => [a] -> a
product xs = foldl (\acc curr -> acc * curr) 1 xs
```

Or a right fold:

```haskell
product :: (Num a) => [a] -> a
product xs = foldr (\curr acc -> curr acc) 1 xs
```

(Note that the accumulator and the current value switch places here.)

You can also use `foldl1` and `foldr1`, which let you omit the starting value:

```haskell
let
    sum :: (Num a) => [a] -> a
    sum xs = foldl1 (\acc curr -> acc + curr) xs
in
sum [1,2,3,4,5,6] -- returns 21
```

»[W]e usually use right folds when we're building up new lists from a list.« (Lipovaca, p.55) Furthermore, right folds can be used on infinite lists, while left folds can't.

`scanl` and `scanr` work almost the same as `foldl` and `foldr` only they will return the starting values, all intermediate accumulator values and the final accumulator value as a list. So `scanl (+) 0 [2,4,8,16]` will return `[0,2,6,14,30]`.

### Operators

You can give your functions operators as a name. For example, `+++` is a valid name for a function. However, your custom operators must not start with a `:`.

### Infix operators

Infix operators like `+` also represent functions. For example, `:` (called ›cons‹) prepends something to a list: `1 : 2 : []` returns `[1, 2]`. Appending to a list can't be done directly, but by by concatenation: `[555, 666] ++ [777]`. (This procedure is computationally more expensive than prepending though.)

Another infix operator is `!!`, which takes a list and an index and returns the element at that index from the list:

```haskell
([1,10,100,1000] !! 3)
```

This will return 1000, because lists are 0-indexed.

### Bindings

The two kinds of binding constructs in Haskell are:

- `let ... in`
- `where`

`where` bindings are available in the whole function. `let` bindings are more local, e.g. if you're using guards the `let` bindings will not be accessible from ›behind‹ the guard. Several `let` can be seperated with a `;` or by aligning tem via indentation:

```haskell
(let a = "Hey!"; let b = "How are you?" in a ++ " " ++ b)

let a = "Hey!"
    b = "How are you?"
in  a ++ " " ++ b
```

### Error Handling

It's interesting to note that Haskell has no nullable types. Error Handling in Haskell can be done with the `Maybe` and `Either` types. `Maybe` is used for data than can be either present or not present (defined or undefined). It will always need a type for the potential data, like `Maybe Int`. Here's [two](https://blog.thomasheartman.com/posts/haskells-maybe-and-either-types) [examples](https://www.gtf.io/musings/why-haskell):

```haskell
safeDiv :: Integral a => a -> a -> Maybe a
safeDiv _ 0 = Nothing
safeDiv x y = Just $ x `div` y
```

```haskell
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x
printTheFirstThing :: [String] -> IO ()
printTheFirstThing myList = case safeHead myList of
  Just something -> putStrLn something
  Nothing -> putStrLn "You're list is empty."
```

In order to do some more verbose error handling and validation that will not just throw `Nothing`, but some default value for example, you would use the `Either` type. It is roughly defined as `data Either e x = Left e | Right x`. It is a convention to use the `Left` value whenever something fails (hence I called its variable `e` for error) and the `Right` value for when everything goes right. So the [previous example](https://blog.thomasheartman.com/posts/) could be rewritten as:

```haskell
safeDiv :: Integral a => a -> a -> Either String a
safeDiv _ 0 = Left "You cannot divide by zero."
safeDiv x y = Right $ x `div` y
```

### Fixity declarations

In order to create your own infix operators, you will use so-called ›fixity declarations‹ like `infix`, `infixl` or `infixr` (cf. [here](https://wiki.haskell.org/Keywords#infix.2C_infixl.2C_infixr)). »A fixity states how tightly the operator binds and whether it's left-associative or right-associative« (Lipovaca, 2011).

## Data types and typeclasses

Types can be determined by invoking `:t` followed by the expression in question. This will return the expression followed by `::` (which reads as ›has type of‹ and is also known as ›Paamayim Nekudotayim‹) followed by the type.

Some standard data types in Haskell are:

- Lists (`[]`)
- Booleans (`Bool`)
- Characters (`Char`)
- Strings (`String` or `[Char]`)
- Integers (`Int` (bounded) or `Integer` (no upper or lower boundary) or `Integral` (whole numbers))
- Tuples (`()`)
- Unit (`()`)
- Function Types
- IO and IOError Types
- `Maybe`, `Either`

Further common types:

- exact rational numbers (`Ratio`)
- Floating point number with single precision (`Float`)
- Floating point number with double precision (`Double`)
- `Number`
- `Fractional`

For storing key-value pairs you would use association lists (or: dictionaries), which are just list of pairs:

```haskell
[("Alpha","one")
,("Beta","two")
,("Gamma","three")
]
```

Usually, you would use the [`Data.Map`](#datamap) module here, which exports a `Map` type and corresponding functions useful for key-value pairs. Maps are unordered though.

_Type classes_ are like interfaces in other programming languages in that they non-exhaustively define certain behaviour of a type.

Some common type classes are `Eq`, `Ord`, `Enum`, `Bounded`, `Show` (converts to string), `Read` (converts from string) and `Ord` (can have three values: `LT`, `EQ` and `GT`).

Good to know: When defining types, constructors, type classes or kinds yourself they must start with an uppercase letter - or if you give them an operator name, that one should start with a `:`.

### Lists

Are arguably the most important data type in Haskell.

They are homogenous, meaning they cannot hold elements of different types. So you can have a list like `listOfNumbers = [1,2,3,4,5]` or `listOfLetters = ['A','B','C','D','E']`. An easier way to write those though is by using _enumeration_: `listOfNumbers = [1..5]`
`listOfLetters = ['A'..'E']`. Not that _enumerations only go forward_, so that `listOfNumbers = [5..1]` would just be an empty list. (However, for negative integers `listOfNumbers = [-5.. -1]` would work.) If you want to go backwards with ranges, you will have to specify a step: `listOfNumbers = [5,4..1]`.

#### List comprehension

Consider this example from »Learn You a Haskell for Great Good!«:

```haskell
[a+b | (a,b) <- xs]
where xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
```

The `(a,b) <- xs` is a so-called generator, which takes every tuple from xs (you can read it as ›is drawn from‹) and pipes it to left-side of the `|` guard (read: ›such that‹).

List comprehensions can include predicates. Let's say we only want the sum of even numbers, we could write:

```haskell
let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
in
    [a+b | (a,b) <- xs, even a, even b]
```

and would get `[6]` as a result. (The `, even a, even b` part are the ›predicates‹.)

Using list comprehensions is similar to using `map` and mostly they're interchangeable.

### Tuples

»A tuple is [...] a type with a fixed number of components, each of them holding a value, not necessarily of the same type.« (Serrano Mena)

#### Destructor functions

- `fst` gives the first component of a tuple
- `snd` gives the second component of a tuple

### Conditions & Control structures

In Haskell if-then-else statements look like this:

```haskell
if b then t else f
```

In contrast to other languages like Javascript, there always has to be an else case.

Equality is checked with the `==` operator and inequality with `/=`.

`case` statements in Haskell are like switch statements in other languages and are constructed like that:

```haskell
case expression of  patternOne -> resultOne
                    patternTwo -> resultTwo
                    patternThree -> resultThree
```

Case statements,like pattern atching, go from top to bottom, so you can't have your catch-all pattern at the top, but should always but it at the bottom:

```haskell
f x = case x of 0 -> 18
                1 -> 15
                2 -> 12
                _ -> 0
```

✨ By the way, »pattern matching in function definitions is syntactic sugar for case expressions.«

<!-- TODO:
### Type classes

Are similar to interfaces in OOP in that they determine the types of operations they permit their members. Also you can create instances of classes: `class`, `instance`
[...]
-->

### Type signatures

For functions type declaration is done with the `::` operator:

```haskell
someFunction :: Int -> Int -> Int -> Int
someFunction a b c = a + b + c
-- That whole first line there is called the *type signature*.
```

Here, the return type is the last item in the declaration and the parameters are all the items before the last one.

If no types are specified, Haskell's interpreter will infer the type. **Type inference** is defined as »the automatic determination of the type of each expression based on the functions and syntax construct being used« (Serrano Mena).

Haskell's compiler (GHC) checks types _statically_. That means that all your expressions will be type checked before they are executed; there's **no implicit type conversion** as in dynamically typed languages. Haskell urges one towards _type-oriented programming_.

There's also _dependent typing_, which is an even stronger form of type checking.

#### Type variables

»Functions that have type variables are called polymorphic functions.« When running `:t` on such functions their type declaration (_type signature_) will contain type variables, which are written in lowercase letters, while types are written in uppercase.

### Parametricity

Parametricity or _parametric polymorphism_ refers to the ability of a function to work on any possible type or to a data type that can store values of any type. It's comparable to [Generics in TypeScript](https://www.typescriptlang.org/docs/handbook/2/generics.html).

> [P]olymorphic function must work for all types, not just for some. Haskell also allows functions to be applicable for just a subset of all types. That is referred to as ad hoc polymorphism [...] (Serrano Mena, p. 65)

### Type annotations

In order to explicitely say, which type an expression is supposed to have, we can use the `::` operator at the end of an expression followed by the desired type:

<!-- TODO:
```haskell
[...]
```
-->

### Class constraints

Class constraints are denoted with the `=>` symbol.

```haskell
(==) :: (Eq a) => a -> a -> Bool
```

This says that the two `a` values must be of the `Eq` class.

### Class definitios

<!-- TODO -->

```haskell
class  Eq a  where
   (==), (/=) :: a -> a -> Bool
```

»The definition states that if a type `a` is to be made an instance of the class `Eq` it must support the functions `(==)` and `(/=)` - the class methods - both of them having type `a -> a -> Bool`.« ([source](https://en.wikibooks.org/wiki/Haskell/Classes_and_types#Classes_and_instances))

## Syntax

### Arrows

As you've just seen above, there's two types of arrows in Haskell: single arrows `->` are used to describe the function types (what a function takes and what it returns). The double arrow `=>` (which always comes first) describes class constraints on the type variables, i.e. what class a variable is supposed to belong to.

### Parantheses and spaces

From the [Haskell Cheat Sheet](https://hackage.haskell.org/package/CheatSheet-1.10/src/CheatSheet.pdf): »Haskell can be written using braces and semicolons [...]. However, no one does. Instead, the ›layout‹ rule is used, where spaces represent scope. The general rule is: always indent.«

### Guards

»[G]uards are a way of testing whether some property of a value (or several of them) are true or false« by boolean conditions and they are similar to if else trees.

The `|` guard is similar [to the `|` in set theory](https://stackoverflow.com/a/21285008/20232056) and you can read as ›such that‹.

In pattern-matching guards are used to extend your pattern and check for Boolean conditions. It's an alternative to checking for certain conditions later in the code. So instead of writing:

```haskell
...
```

– you could write:

```haskell
...
```

It is common in Haskell to write `| otherwise` for that part of your pattern matching that takes care of all the remaining cases:

```haskell
addOnlySmallNumber x _ | x < 5 = show (x + y) ++ " is the sum."
addOnlySmallNumber _ y | y < 5 = show (x + y) ++ " is the sum."
addOnlySmallNumber x y | otherwise = "Your numbers are too big :(."
```

Which can be written more concisely as:

```haskell
addOnlySmallNumber x y
    | x < 5 = show (x + y) ++ " is the sum."
    | y < 5 = show (x + y) ++ " is the sum."
    | otherwise = "Your numbers are too big :(."
```

<!--
### Records

similar to *named arguments* in other prgramming languages
-->

### Primes

We use a prime – written as `'` – in a pattern match, when we have two highly related variables/bindings, but we need a different name for one of them. We would use, e.g., `n` and `n'`, so the compiler will not complain about reusing the name of an already established definition.

### Layout

Haskell uses a layout-based syntax. That means, »how a line is indented isn't as important as the fact that all elements in the same block start in the same column. [E.g.] in an `if` block, the lines for `then` and `else` must be indented the same way.«

### Pragmas

A pragma is a special comment, which gets interpreted by the compiler and lets you enable or disable certain functionalities (sort of like extensions to the language). Pragma in Haskell look like this `{-# LANGUAGE ViewPatterns #-}` and need to be placed at the top of your source file. The equivalent in the interpreter is `:set -XViewPatterns`.

### Other conventions

- When we do pattern-matching and we do not care what a specific element is, we usually name that element `_`.
<!-- TODO:
- [...]
  -->

## Lazy evalution

Haskell's default evaluation model or execution strategy is built on _laziness_.

<!-- TODO:
[...]
-->

There's also libraries for parallel and concurrent execution of expressions, because the order of execution in Haskell doesn't strictly matter.

<!-- TODO:
[...]
-->

## Data Types

Data types are constructed via the `data` keyword and different constructors are seperated by a guard `|`.

A data type without constructors and with empty alternatives is similar to an enum in other languages:

```haskell
data NameOfDataType = OneAlternative | TheOtherAlternative | AThirdAlternative
```

Type names and constructors often share the same name:

```haskell
...
```

Notice that there is also a `type` keyword, which is not used for defining types though, but only for _type synonyms_:

```haskell
type String = [Char]
```

Type synonyms are useful for making code more readable and keeping it well documented. Types and type synonyms can only be used in the type part of your Haskell code, i.e. not inside of function definitions or anything (unless you use a `::` somewhere inside your function body).

Alternatively, you can also use the `newtype` decleration instead of `data`. Its very similar to `data` with the exception that the value constructor of `newtype` is strict and the one of `data` is lazy, and `newtype` can only be used, if the type has one single constructor with precisely one field.

### Algebraic Data Types (ADT)

Instead of OOP-tyle classes, in Haskell you will use data types. One common type of data are Algebraic Data Types. (Learn about the origin of that term [here](https://blog.poisson.chat/posts/2024-07-26-adt-history.html).) ADTs are defined by two sorts of data:

- a »name for the type that will be used to represent its values«, and
- one or more data constructors, which »will be used to create new values. These constructors may have arguments that hold values of the specified types.«

```haskell
data NameOfDataType = NameOfConstructorOne String
                    | NameOfConstructorTwo String Integer
                    | NameOfConstructorThree String String Bool
                    deriving (Show)
```

`deriving (Show)` is optional. It's used so that you can print the values without having to write a custom function for that (_automatic deriving_). What happens is that our data type becomes a member of the `Show` typeclass.

Also notice that inside of our ADT, we defined three more types `NameOfConstructorOne`, `NameOfConstructorTwo` and `NameOfConstructorThree`. The names of these constructors must be unique inside a module. However, constructors can have the same name as the data type that they belong to: `data Point = Point Float Float deriving (Show)`

Alternatively, we could have used ›record syntax‹ for writing a data type, which would look like this:

```haskell
data Person = { firstName :: String
              , lastName :: String
              , age :: Int
              , profession :: Maybe String
              } deriving (Show)
```

### Type constructors

The previously defined data types are _value constructors_, because they takes some values as parameters and give out a new value. In a similar manner we also have _type constructor_, which produce new types, for example:

```haskell
data Maybe a = Nothing | Just a
```

`Maybe` is not a type in itself. Only if we provide some value for `a` (i.e. parametrizing it) does it become a type (a so-called _concrete type_):

```haskell
:t Just "Hello" -- Just "Hello" :: Maybe [Char]

:t Just [1,2,3,4] -- Just "1234" :: Num a => Maybe [a]

:t Nothing -- Nothing :: Maybe a
```

<!--
### Smart Constructors and Views

Serrano Mena, p.79pp.
-->

## Pattern matching

Pattern matching allows you to check if some data matches a certain pattern and then destructure the data according to that pattern.

»[P]atterns are checked in the same order they appear in the code.«

A come pattern is `x:xs` which binds the head of a list to `x` and the rest of the list to `xs`. In a function, you have to put `x:xs` in parantheses, because you are binding mutiple values:

```haskell
someFunction :: [a] -> a
someFunction (x:xs) = x
```

»[I]t’s customary in haskell to write pattern matching on lists using a letter or a small word followed by the same identifier in plural, like `x:xs`.« (Serrano Mena, p. 48)

In order to use two elements in pattern matching, you can write `(x:y:zs)`.

**Note that »pattern matching works [only] on constructors«**. (Lipovaca, p. 103)

### as patterns

_as patterns_ allow you to destructure data according to the pattern, but still keep a reference to the original data:

```haskell
thirdLetter :: (Char a) => [a] -> a
thirdLetter [] = "That string is too short"
thirdLetter (_:xs) = "That string is too short"
thirdLetter (_:_:xs) = "That string is too short"
thirdLetter string@(_:_:x:xs) = "The third letter in " ++ string ++ " is: " ++ [x]
```

Here, `string` is the variable name given to the whole pattern you are matching on.

_As pattern_ »allows you to bind some value in the match while at the same time allowing you to match on inner components of that value.« (Serrano Mena, p. 48)

## Monads, Monoids, applicative functors, functors

<!-- TODO:

Monadic contexts...

### Context

[...]

#### Context wrapping

[...]

-->

### Functors

`fmap`, or `<$>` (which is the infix variant of `fmap`)

**Functors let you apply functions to a value wrapped in a context.**

### Applicative functors

**Applicatives let you apply functions wrapped in a context to a value wrapped in a context.**

`liftA`, or `<*>`

### Monads

»Monads apply a function that returns a wrapped value to a wrapped value. Monads have a function `liftM` or `>>=` (pronounced ›bind‹) to do this.«

## The Interpreter

Loading files into the interpreter is done with the `:l` command followed by the path to the file.

## Haskell ecosystem

Building and packaging tools for Haskell are _cabal_ and _stack_.

The online repository for Haskell libraries are called _Hackage_ (for _cabal_) and _Stackage_ (for _stack_).

The main installer for Haskell is _GHCUp_.

Haskell funtions, types and typeclasses can be grouped into modules and a Haskell function can be thought of as a collection of modules. `Prelude` is the standard Haskell module that is always imported by default.

In order to search Haskell libraries by function names, or type signatures there is an API called [Hoogle](https://hoogle.haskell.org/).

_Haddock_ is a markup language in Hakskell that is used to annotate your code so that you have a proper documentation for your functions usually done by writing `-- |` before your function definition or `-- ^` after (or next to) it. (Check these [Haddock tips](https://kowainik.github.io/posts/haddock-tips) for some more background.)

## Sources

- [Functional Programming by Example](https://caiorss.github.io/Functional-Programming/index.html) by Caio Rodrigues (2018)
- Learn You a Haskell for Great Good! A Beginner's Guide by Miran Lipovaca (2011, No Starch Press)
- Practical Haskell. A Real-World Guide to Functional Programming by Alejandro Serrano Mena (2022, Apress)
- [Learn X in Y minutes. Where X=Lambda Calculus](https://learnxinyminutes.com/docs/lambda-calculus/) by Max Sun et al. (2023)
- [Haskell Cheat Sheet](https://hackage.haskell.org/package/CheatSheet-1.10/src/CheatSheet.pdf) by Justin Bailey (2009)
- [Why Haskell?](https://www.gtf.io/musings/why-haskell)
