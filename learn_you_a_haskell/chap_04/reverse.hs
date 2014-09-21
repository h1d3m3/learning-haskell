-- Takes a list, reverses it.
reverse' :: [a] -> [a]

-- bail out of list is empty
reverse' [] = []

-- split head,rest, recurse on new list that has rest first and head at the end
reverse' (x:xs) = reverse' xs ++ [x]
