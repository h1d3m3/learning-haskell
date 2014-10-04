-- takes an array of tuples where k has to be ord
fromList' :: (Ord k) => [(k,v)] -> Map.Map k v  
-- right to left
-- init accum is empty map
-- iterator takes k/v and cc which inserts key and value into accum
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty 
