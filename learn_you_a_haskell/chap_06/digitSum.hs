import Data.Char
import Data.List

digitSum :: Int -> Int
-- turn Int to string
-- map each string char to real number
-- accumulate sum
digitSum = sum . map digitToInt . show

firstTo :: Int -> Maybe Int
-- find from list, where first digitsum equals passed in number
firstTo num = find (\x -> digitSum x == num) [1..]


{-
*Main Data.Char> digitSum 234
9
*Main> firstTo 44
Just 89999

-}
