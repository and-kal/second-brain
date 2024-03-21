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

## an unzip function

```haskell
unzip' [x, y] = ([fst x, fst y], (snd x, snd y))
```

# Exercise 3-1. A New Life as Type Checker

```haskell
swapTriple :: (c, a, b) -> (a, b, c)
swapTriple (x,y,z) = (y,z,x)
```

```haskell
duplicate :: a -> (a ,a)
duplicate x = (x,x)
```

```haskell
nothing :: p -> Maybe a -- why does it infer `p`?
nothing _ = Nothing
```

```haskell
index :: [a] -> [(Int, a)]
index [] = []
index [x] = [(0,x)]
index (x:xs) =  let indexed@((n,_):_) = index xs
                in (n+1,x):indexed
```

```haskell
maybeA :: [a] -> Char
maybeA [] = 'a'
```
