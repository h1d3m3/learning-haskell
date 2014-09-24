-- This will not match a empty list, and will fail when xs is empty
badExample (x:xs) = x + badExample xs

-- Same as above, but will match whatever the first pattern misses
goodExample (x:xs) = x + goodExample xs
goodExample _      = 0
