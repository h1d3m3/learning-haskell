-- This doesn't handle bad input very well.

-- RPN string in, value out
solveRPN :: String -> Double
-- input string into array of items
-- left to right, foldFunc over each array item, build up empty array
-- head is result
solveRPN = head . foldl foldingFunction [] . words
		-- match two items, operator, ys is remainder, push result to beginning of result
	where	foldingFunction (x:y:ys) "*" = (y * x):ys
		foldingFunction (x:y:ys) "+" = (y + x):ys
		foldingFunction (x:y:ys) "-" = (y - x):ys
		foldingFunction (x:y:ys) "/" = (y / x):ys
		foldingFunction (x:y:ys) "^" = (y ** x):ys
		foldingFunction (x:xs) "ln" = log x:xs
		-- take whatever is in the array, apply sum
		foldingFunction xs "sum" = [sum xs]
		-- no operator was found, xs is accum, numberString is array item
		foldingFunction xs numberString = read numberString:xs
		
{-
*Main> words "1 2 3 4 5 sum 2 +"
["1","2","3","4","5","sum","2","+"]
*Main> read "1" :: Int
1
-}
