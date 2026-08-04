---
title: "Trees and streams"
date: "2026-04-01"
draft: true
---

> A tree in functional programming is typically defined recursively. A tree node can have multiple children or branching: `Tree a = Leaf a | Node (Tree a) (Tree a)`

So, trees are a data structure that consist of an element called a _node_, which points to an element on the left and an element on the right, both of which are trees again. (You can also define trees with more than two child nodes of course, but the kind of binary tree just described is very common.) This recursive definition says that a tree either branches into a node with two subtrees or it can be leaf, i.e. the final node, which can a so-called singleton or nothing. (Thus, trees can be described as a **recursive data structure**; for more details, check [this blog post](https://dkalemis.wordpress.com/2014/01/23/trees-in-haskell/).)

> A stream, or lazy list, is defined similarly but with exactly one tail, where a tree node can have at most one child. A stream is a linear, unbranching tree. `Stream a = Cons a (Stream a) | Nil`

`Nil` is the end of the stream, while `Cons a (Stream a)` means »one value plus the rest of the stream«.

> A stream is a degenerate tree. A tree can always be flattened into a stream, by choosing a depth- or breadth-first traversal; but reconstructing the tree requires additional information that the stream alone doesn’t contain. ([source](https://forum.malleable.systems/t/love-letter-to-catlangs/410/37))

That means that a stream has a singular direction, there is no branching.

```
Tree: one root, many branches, many possible children at each step.

Stream: one item, then the next item, then the next item, in a straight line.
```

A tree is “one-to-many,” while a stream is “one-to-one.” A stream is just a tree that never branches.

## In Haskell

In Haskell, trees are not built-in, so you have to import the or define the data type yourself, like so:

```haskell
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)
```

Or using record syntax:

```haskell
data Tree a = EmptyTree | Node {leftBranch :: Tree a, rightBranch :: Tree a} deriving (Show, Read, Eq)
```

Note that `EmptyTree` and `Node` are user-defined as well and not built-in either.
