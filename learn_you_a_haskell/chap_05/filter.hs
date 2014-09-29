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


-- takes a 1 param function that returns a Bool and a list array, returns a list
filter2' :: (a -> Bool) -> [a] -> [a]

-- p is function that returns bool
-- right to left map
-- foldr takes anon function (params are x from main list and accum)
-- if predicate is true, return x prepended to accum. Otherwise just return the acc.
-- so apply predicate to each item in list, prepend to acc or leave out
filter2' p = foldr (\x acc -> if p x then x : acc else acc) []

{-
*Main> filter2' (odd) [1..10]
[1,3,5,7,9]
-}
