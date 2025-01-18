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

# custom `elem`

`elem` using `find` and pattern matching:

```haskell
elem' :: a -> [a] -> Bool
elem' needle haystack = case find (== needle) haystack of
    Just _ -> True
    False -> False
```

# Exercise 4-2. Altering Your Maps

```haskell
import qualified Data.Map as M

{-# LANGUAGE LambdaCase #-}

insert' k v m = M.alter (\case
                        Nothing -> Just v
                        Just _ -> Just v
                        ) k m

delete' k m = M.alter (\case
                        Nothing -> Nothing
                        Just _ -> Nothing
                        ) k m

adjust' f k m = M.alter (fmap f) k m
```

# Exercise 4-3. Classifying Clients

```haskell
data Client i = GovOrg { clientId :: i, clientName :: String }
            | Company { clientId :: i, clientName :: String, person :: Person, duty :: String }
            | Individual { clientId :: i, person :: Person }
deriving (Show, Eq, Ord)

data ClientKind = GovOrgKind | CompanyKind | IndividualKind

clientKind :: Client i -> ClientKind
clientKind (GovOrg _ _)      = GovOrgKind
clientKind (Company _ _ _)   = CompanyKind
clientKind (Individual _ _)  = IndividualKind

classifyClients1 = foldr insertClient Map.empty
  where
    insertClient client acc =
      Map.insertWith Set.union (clientKind client) (Set.singleton client) acc

classifyClients_2 clients =
  let (govOrgs, companies, individuals) = foldr splitClient ([], [], []) clients
  in Map.fromList [ (GovOrgKind, Set.fromList govOrgs)
                  , (CompanyKind, Set.fromList companies)
                  , (IndividualKind, Set.fromList individuals)
                  ]
  where
    splitClient client (gos, cos, indvs) =
      case clientKind client of
        GovOrgKind     -> (client : gos, cos, indvs)
        CompanyKind    -> (gos, client : cos, indvs)
        IndividualKind -> (gos, cos, client : indvs)
```
