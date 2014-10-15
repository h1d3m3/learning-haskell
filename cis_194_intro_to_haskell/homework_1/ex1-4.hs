import Data.Char
import Test.QuickCheck

-- turn a multi-digit number into individual numbers
toDigits :: Integer -> [Integer]
toDigits n 
	| n <= 0 = []
	| otherwise = map (\d -> toInteger $ digitToInt d) (show n)


toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits


-- Double each second number, starting from the RHS
doubleEveryOther :: [Integer] -> [Integer]
-- the fold will return a tuple, only need the accumulated list (first)
doubleEveryOther xs = fst $ foldr 
	-- lambda takes in value from xs, and a tuple that contains the accumulated list and whether to actually double the value
	(\value (accumList, doubleValue) -> 
		-- The accum list and the boolean tuple become the data structure being passed through the fold
		(
			-- Double (or not) the value and prepend the value to the main list
			(if doubleValue then (value * 2) else value) : accumList, 
			-- Set the doDouble for the next iter to to the opposite of what we just did 
			not doubleValue
		)
	) 
	-- Initial accumulator is empty list, and set doubleValue to false on right most list item
	([],False) xs
                                   
-- take an array of integers, sum up all the individual numbers
sumDigits :: [Integer] -> Integer
-- left fold all chars from the int array into a single string
-- take each char from that string, convert to Int/Integer, then sum up
sumDigits xs = sum $ map (\c -> toInteger $ digitToInt c) $ foldl (\acc x -> acc ++ show x) "" xs
-- same
sumDigits' xs = foldl (\acc x -> acc + (sum $ map (\c -> toInteger $ digitToInt c) (show x))) 0 xs


-- put it all together. a credit card number validator
validate :: Integer -> Bool
validate xs = (sumDigits . doubleEveryOther $ toDigits xs) `rem` 10 == 0

main = do
	quickCheck (toDigits 1234 == [1,2,3,4])
	quickCheck (toDigitsRev 1234 == [4,3,2,1])
	quickCheck (toDigits 0 == [])
	quickCheck (toDigits (-17) == [])
	quickCheck (doubleEveryOther [1,2,3] == [1,4,3])
	quickCheck (doubleEveryOther [8,7,6,5] == [16,7,12,5])
	quickCheck (sumDigits [16,7,12,5] == 22)
	quickCheck (validate 4012888888881881 == True)
	quickCheck (validate 4012888888881882 == False)
