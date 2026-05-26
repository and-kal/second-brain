---
title: "Trees and streams"
date: "2026-04-01"
draft: true
---

> A tree in functional programming is typically defined recursively. A tree node can have multiple children or branching. `Tree a = Leaf a | Node (Tree a) (Tree a)`

This recursive definition says that a tree either branches into a node with two subtrees or it can be leaf, i.e. the final node.

> A stream, or lazy list, is defined similarly but with exactly one tail, where a tree node can have at most one child. A stream is a linear, unbranching tree. `Stream a = Cons a (Stream a) | Nil`

Nil is the end of the stream, while `Cons a (Stream a)` means »one value plus the rest of the stream«.

> A stream is a degenerate tree. A tree can always be flattened into a stream, by choosing a depth- or breadth-first traversal; but reconstructing the tree requires additional information that the stream alone doesn’t contain.

([source](https://forum.malleable.systems/t/love-letter-to-catlangs/410/37))

That means that a stream has a singular direction, there is no branching.

```
    Tree: one root, many branches, many possible children at each step.

    Stream: one item, then the next item, then the next item, in a straight line.
```

A tree is “one-to-many,” while a stream is “one-to-one.” A stream is just a tree that never branches.
