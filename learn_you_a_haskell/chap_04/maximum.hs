-- returns the largest value in a list

-- match empty list
maximum' [] = error "max of empty list!"

-- match single list item 
maximum' [x] = x

-- split list into head and rest
-- take the max of head or recursive max rest
maximum' (x:xs) = max x (maximum' xs)
