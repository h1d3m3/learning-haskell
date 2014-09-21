-- Takes an array of ordinals, returns an array
quicksort :: (Ord a) => [a] => [a]

-- nothing to do
quicksort [] = []

quicksort (x:xs)  = 
	-- the head x is the pivot, xs is the rest
		-- build a list of things smaller or equal to x
	let 	smallerOrEqual = [a | a <-xs, a <= x]
		-- build a list of things greater than x 
		larger = [a | a <- xs, a > x]
		-- recurse on smaller list and larger around pivot
	in	quicksort smallerOrEqual ++ [x] ++ quicksort larger
