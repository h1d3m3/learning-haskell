-- interact puts stdin into the function and takes the function output to stdout
main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes = unlines . map (\xs -> if isPal xs then "palindrome" else "not a palindrome") . lines

isPal :: String -> Bool
isPal xs = xs == reverse xs

{-
Prelude> :i interact
interact :: (String -> String) -> IO () 	-- Defined in ‘System.IO’
*Main> main
elephant
not a palindrome
radar
palindrome
abba
palindrome
cookie
not a palindrome
-}

