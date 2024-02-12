---
title: "Serrano Mena exercises"
---

# Exercise 2-6. More Matches and Guards

## Ackermann function

```haskell
ackermann :: Integer -> Integer -> Integer
ackermann m n
    | m == 0 = n+1
    | n == 0 = ackermann (m-1) 1
    | otherwise = ackermann (m-1) $ ackermann m (n-1)
```

[See here](https://discourse.haskell.org/t/ackermann-function/1410) for a solution with dynamic programming.
