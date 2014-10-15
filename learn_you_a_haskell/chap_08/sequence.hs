main = do
	-- turns each array item into something that produces IO	
	result <- sequence [getLine, getLine, getLine]
	print result



{-
*Main Data.Char Control.Monad> main
a
b
c
["a","b","c"]

*Main Data.Char Control.Monad> map print [1,2,3,4]

<interactive>:86:1:
    No instance for (Show (IO ())) arising from a use of ‘print’
    In a stmt of an interactive GHCi command: print it
*Main Data.Char Control.Monad> sequence $ map print [1,2,3,4]
1
2
3
4
[(),(),(),()]



-}


