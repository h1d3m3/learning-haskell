myDrop :: Int -> [a] -> [a]
-- drop n from xs
myDrop n xs = if n <= 0 || null xs -- don't touch if nul or n <= 0
	then xs
	else myDrop (n - 1) (tail xs) -- take one, reduce xs, recurse
