-- Pattern Match on a 3-tuple, return 3rd
third (a, b, c) = c

-- "match" a boolean, something a , first and rest of a list, and the number 5, return a and the rest of the list
complicated (True, a, x:xs, 5) = (a, xs)


{-
This is a multi-line comment showing the call and results

> complicated (True, 1, [1,2,3], 5) 
(1,[2,3])

-}


