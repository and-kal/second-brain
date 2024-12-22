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
