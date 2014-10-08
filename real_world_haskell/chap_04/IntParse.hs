import Data.Char (digitToInt)

-- 0 is accum, xs is string of numbers
asInt :: String -> Int
asInt xs = loop 0 xs

-- empty list returns accum result
-- define acc' as accum * 10 (10's position) + first char of string as a number
-- loop again with new accum and the rest of the array
loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
		  in loop acc' xs


