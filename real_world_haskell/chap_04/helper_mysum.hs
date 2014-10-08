mySum :: Num a => [a] -> a
-- call the inner function with 0 as accum and the list
mySum xs = helper 0 xs
	-- define helper as adding x to accum and passing the accum result and remaining list back to itself
	where 	helper acc (x:xs) = helper (acc + x) xs
	-- the list is not empty, just return the sum
		helper acc _ = acc
