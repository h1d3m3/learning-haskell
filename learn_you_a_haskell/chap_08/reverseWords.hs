-- starter function
main = do
	-- IO result into line
	line <- getLine
        -- get out of main	
	if null line
		-- return an empty IO action
		-- but this is not a normal return, it returns an empty IO to main
		then return ()
	-- we have to return one IO action (main)
	else (do
		-- reverse the line, start again
		putStrLn $ reverseWords line
		main)

reverseWords :: String -> String
-- single string line into words array, reverse each item in the the array (reverse word), back into single string line
reverseWords = unwords . map reverse . words


{-
*Main Data.Char> main
it was all a dream
ti saw lla a maerd
*Main Data.Char> map reverse ["hello"]
["olleh"]
-}
