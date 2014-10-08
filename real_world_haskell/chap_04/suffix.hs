

-- These two functions are the same
-- but the first makes things a little clearer

-- with binding
tails1 :: [a] -> [[a]]
tails1 whole@(x:xs) = whole : tails1 xs
tails1 _ = []

-- without binding (and it has to rebuild (x:xs)
tails2 :: [a] -> [[a]]
tails2 (x:xs) = (x:xs) : tails1 xs
tails2 _ = []

{-
*Main Data.List> tails1 [1..10]
[[1,2,3,4,5,6,7,8,9,10],[2,3,4,5,6,7,8,9,10],[3,4,5,6,7,8,9,10],[4,5,6,7,8,9,10],[5,6,7,8,9,10],[6,7,8,9,10],[7,8,9,10],[8,9,10],[9,10],[10]]
*Main Data.List> tails2 [1..10]
[[1,2,3,4,5,6,7,8,9,10],[2,3,4,5,6,7,8,9,10],[3,4,5,6,7,8,9,10],[4,5,6,7,8,9,10],[5,6,7,8,9,10],[6,7,8,9,10],[7,8,9,10],[8,9,10],[9,10],[10]]
-}
