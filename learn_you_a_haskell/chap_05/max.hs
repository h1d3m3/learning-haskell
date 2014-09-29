-- a has to be ord
-- array of as, return a
maximum' :: (Ord a) => [a] -> a
-- left to right in array
-- apply max to each element
-- accumlate max result (i.e. first max result becomes accumulator)
-- the 1 means it doesn't need the accumulator to be initialized
maximum' = foldl1 max
