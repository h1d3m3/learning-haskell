-- Take a number (items) and a list to take from
take' :: (Num i, Ord i) => i -> [a] -> [a]

-- n is the number of items to take
take' n _
	| n <= 0 = [] -- empty if nothing to take. _ because we don't care about the list here

-- nothing to take from the empty set
take' _ [] = []

-- split up, return the head, recurse and dec the number of thing to take on the rest
take' n (x:xs) = x : take' (n-1) xs
