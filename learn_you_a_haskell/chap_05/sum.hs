-- takes a function with a, and a list of a, return a single a
sum' :: (Num a) => [a] -> a

-- acc and x returns acc + x
-- foldl applies the func to 0 (acc is starting) and each item in the list
-- so accumulator starts with 0, builds up with each x
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- Even better
sum2' :: (Num a) => [a] -> a

-- (+) is the same as (\acc x -> acc + x)
-- and sum2` is partially applied (waiting for a list)
sum2' = foldl (+) 0

