-- Pattern Matching, return the opposite based on what is passed in.
myNot True  = False
myNot False = True

-- keep adding head to rest of list
sumList (x:xs) = x + sumList xs
-- pattern match on empty list returns 0
sumList []     = 0
