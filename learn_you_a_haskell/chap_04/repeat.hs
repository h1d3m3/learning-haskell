
-- produces an infinite list, use with take

-- take a value, return a list
repeat' :: a -> [a]

-- create a list of the input, plus recurs to create a new list of the same input
repeat' x = x:repeat' x
