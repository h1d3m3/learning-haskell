type AssocList k v = [(k,v)]

kv1 = [(1,2),(2,3),(3,4)]
kv2 = [(1,2),(2,3),(3,4)] :: AssocList Int Int
kv3 = [(1,"a"),(2,"b"),(3,"c")] :: AssocList Int String

{-
*Main> :t kv1
kv1 :: [(Integer, Integer)]
*Main> :t kv2
kv2 :: AssocList Int Int
*Main> :t kv3
kv3 :: AssocList Int String
-}
