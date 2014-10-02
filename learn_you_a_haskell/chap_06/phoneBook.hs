

-- k has to derive eq
findKey :: (Eq k) => k -> [(k,v)] -> v
-- filter where any key == k, get the second part of the tuple from first filter match list
findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs

-- Handling conditions a bit better

-- Same, but not sure there is a result
findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
-- filter where any key == k, get the second part of the tuple from first filter match list
findKey' key [] = Nothing
findKey' key ((k,v) : xs) 
	| key == k = Just v
	| otherwise = findKey' key xs

-- Doing it with a fold
findKey'' :: (Eq k) => k -> [(k,v)] -> Maybe v
-- foldr with Nothing as the init accumulator and xs as the list
-- tuple and acc passed in, if user key is found, then acc gets Just value, otherwise pass on previous acc (that had Nothing or Just v)
findKey'' key xs = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing xs


phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  


{-
*Main> findKey "betty" phoneBook 
"555-2938"
*Main> findKey "wend" phoneBook 
"*** Exception: Prelude.head: empty list

*Main> findKey' "lucille" phoneBook 
Just "205-2928"
*Main> findKey' "abc" phoneBook 
Nothing


*Main> findKey'' "patsy" phoneBook 
Just "493-2928"
*Main> findKey'' "def" phoneBook 
Nothing

-- This is from the standard library
*Main> lookup "betty" phoneBook 
Just "555-2938"
*Main> lookup "wilma" phoneBook 
Nothing
*Main> lookup "penny" phoneBook 
Just "853-2492"

-}
