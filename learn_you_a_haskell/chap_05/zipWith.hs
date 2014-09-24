-- takes a function with three (same or different) types (two params and a return), two list parameters and returns third list (this is reduce)
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
-- if the first or second list is empty, do nothing
zipWith' _ [] _ = []
zipWith' _ _ [] = []
-- f function, head and rest of lists, return applied function to two heads (x and y) and make the same call with remaining lists
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

{-
*Main> zipWith' (+) [1..10] [1..10]
[2,4,6,8,10,12,14,16,18,20]

*Main> zipWith' (max) [3,1,10] [7,1,10]
[7,1,10]

*Main> zipWith' (*) (replicate 5 2) [1..]
[2,4,6,8,10]
-}


