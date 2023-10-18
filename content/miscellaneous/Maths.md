---
title: "Notes on math, trig etc."
date: "2023-06-19"
draft: true
---

## Fixed point vs. floating point
[...]

## Types of numbers

### Real numbers

Real numbers are used for continuous values, that means values with arbitrary precision. Usually, you'll think of floating point numbers here.


## To read

- [A matter of precision](http://tomforsyth1000.github.io/blog.wiki.html#%5B%5BA%20matter%20of%20precision%5D%5D)

## Logarithms

A logarith is the inversion of exponentiation.

A practical example: The entropy of a password is calculated via this formula:
```
E = log2(R^L)
```
Read: the logarithm of (R^L) with base 2 is the entropy, where R is the number of possible characters within the password and L stands for the number of characters in the password. That means the total number of possible guesses is `2 by the power of E`.