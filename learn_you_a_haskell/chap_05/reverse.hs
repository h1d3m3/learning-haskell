-- in array , out array
reverse' :: [a] -> [a]
-- left to right in array
-- anon function takes acc and x
-- prepends x to accumulator 
-- start with empty list
reverse' = foldl (\acc x -> x : acc) []


{-
*Main> reverse' [1..10]
[10,9,8,7,6,5,4,3,2,1]
-}
