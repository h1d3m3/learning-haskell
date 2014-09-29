-- take a function of a returns bool, and a list, and return a list
filter' :: (a -> Bool) -> [a] -> [a]
-- The incoming list is empty, return empty
filter' _ [] = []

-- func is what is evaluating x
-- if func x is trie, return x (adds to list) and call func xs
-- otherwise just move on to the next evaluation
filter' func (x:xs)
	| func x = x : filter' func xs
	| otherwise = filter' func xs

{-
[4,5,6,7,8,9,10]
*Main> filter' (==3) [1..10]
[3]
*Main> filter' even [1..10]
[2,4,6,8,10]
*Main> filter' (`elem` ['A'..'Z']) "LKJHfkdsjfhskdfjhsdfalkjdhfLKJHASFLkjhsdkfjkjdhfskjdhfsLKfkdsjfLSDKjfhsdflkjha"
"LKJHLKJHASFLLKLSDK"
*Main> filter' (<10) (filter even [1..100])
[2,4,6,8]
*Main> [x | x <- [1..100] , x < 10, even x]
[2,4,6,8]
-}
