-- Takes an integer for a count n, returns a list of x repeated n times
rep' :: Int -> a -> [a]
rep' n x
	| n <= 0 = []
	| otherwise = x : rep' (n-1) x
