chain :: Integer -> [Integer]
-- match 1 return array of 1
chain 1 = [1]
chain n
	| even n = n:chain (n `div` 2) -- build array of n and chain recurse n/2
	| odd n = n:chain(n * 3 + 1) -- build array of n and chain n * 3 + 1

numLongChains :: Int
-- build chains 1..100 and filter ones that have a length of over 15, count them
numLongChains = length (filter isLong (map chain [1..100]))
	where isLong xs = length xs > 15

