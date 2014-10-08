import Data.Char

capCount :: String -> Int
-- functional composition
-- words returns a [String] to filter
-- head :: [a] -> a
-- isUpper :: Char -> Bool
-- so together isUpper . head :: [Char] -> Bool
-- filter (isUpper . head) . words :: String -> [[Char]]
-- length :: [a] -> Int
capCount = length . filter (isUpper . head) . words
