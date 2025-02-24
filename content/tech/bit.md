---
title: "Bit-wise operations and low-level programming"
date: "2024-10-16"
draft: true
---

Here's where I'm collecting some insights into bitshift operations and such.

Instead of using modulo, if the divisor is a power of two, you can use a bitshift AND.
So `value % 1024;` is equivalent to `value & 0x3FF;`, where `0x3FF` represents the divisors minus 1, so 1023 in this case. ([source](https://mziccard.me/2015/05/08/modulo-and-division-vs-bitwise-operations/))

Similarly, instead of using regular division `/`, you can right shift a value `n` positions, where `n` is the square root of the divisor. This is useful, if your divisor is a power of two and you want division without remainder:

```javascript
1030 / 16
//64.375
1030 >> 4
//64
```

```python
max_int32 = (1 << 31) - 1
```

## Check, if a number is a power of 2

A bit manipulation method for subtracting 1 from a number is done by flipping the rightmost 1-bit of the number and all the bits to the right of it:

```javascript
// `>>>` is JavaScript's zero-filling right shift operator
let i84 = (84 >>> 0).toString(2)
// 01010100
let i83 = (83 >>> 0).toString(2)
// 01010011
```

Now, for a number to be a power of two, it can have only one `1` in its bit representation. So in order to check, if a number is a power of two, we can do a bitwise AND operation with the number before it and see if we get 0. Let's illustrate this:

```
84 = 01010100
83 = 01010011
84 & 83 = 01010000

64 = 01000000
63 = 00111111
64 & 63 = 00000000
```

## Get some power of two

Say we want to get the 7th power of two, which will be `10000000`, we can do a simple left shift of 1 by 7:

```
1 = 00000001
1 << 7 = 10000000 = 128 = 2^7
```

<!--
## Generate all the possible subsets of a set

([source](https://www.hackerearth.com/practice/basic-programming/bit-manipulation/basics-of-bit-manipulation/tutorial/))

[...]
-->

## Turn bits on and off

In order to turn certain bits in a bit on, use the bitwise OR operation. Say we want to turn on the two most significant bits in a byte, we can just mask our value with the OR operator and the bit representations of 2^7 and 2^6.

```
26 = 00011010
2^7 = 1 << 7 = 10000000
00011010 | 10000000 = 10011010
2^6 = 1 << 6 = 01000000
10011010 | 01000000 = 11011010
```

Similarly, we can turn bits off using the bitwise AND operator and the bitwise NOT:

```
191 = 10111111
2^3 = 1 << 3 = 00000100
~00000100 = 11111011
10111111 & 11111011 = 10111011
```

Finally, to toggle a bit, we would use bitwise XOR. Say, we want to flip bit 5 and 6 of a byte (keep in mind that counting starts at zero), we'd just do this:

```
93 = 01011101
2^5 = 1 << 5 = 00100000
2^6 = 1 << 6 = 01000000
01011101 ^ 00100000 = 01111101
01111101 ^ 01000000 = 00111101
```

## Working with powers of 2

Multiplying by 2^6 is equivalent to shifting a binary number 6 bits to the left: `x*64 = x << 6`. Similarly, you can use left-shifting for division: `x/32 = x >> 5`.

# sources

- [learncpp.com](https://www.learncpp.com/cpp-tutorial/bit-manipulation-with-bitwise-operators-and-bit-masks/)
- [hackerearth.com](https://www.hackerearth.com/practice/basic-programming/bit-manipulation/basics-of-bit-manipulation/tutorial/)
