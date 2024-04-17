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

# Exercise 3-2. Working With Filters

```haskell
filterOnes x = filter (x == 1)

filterANumber x y = filter (x == 1)

filterNot x = filter (not . x)
```

# Exercise 3-3. Your First Folds

```haskell
-- pattern matching
product' :: [Int] -> Int
product' [] = 0
product' (x:xs) = x * product' xs

product' [1,2,3,4,5,6,7,8]

-- using folds
product' :: [Int] -> Int
product' list = foldr (*) 1 list

-- using folds and point-free style
product' = foldr (*) 1

product' [1,2,3,4,5,6,7,8]
```

```haskell
-- pattern matching
all' :: [Bool] -> Bool
all' [] = True
all' (x:xs) = x && all' xs

-- using folds
all' :: [Bool] -> Bool
all' list = foldr (&&) True list

-- using folds and point-free style
all' = foldr (&&) True
```
