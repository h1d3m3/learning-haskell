-- takes in a string, returns an array of strings
splitLines :: String -> [String]

-- Done with empty list
splitLines [] = []


splitLines cs = 
	-- split cs into two parts based on isLineTerminator
	let (pre,suf) = break isLineTerminator cs
        -- I think the "in" allows (pre,suf) to be scoped within the in block
        -- the pre : is the prepend of an array, and we're going to build the rest after : in the case statement
			     -- pattern match \r\n as first two chars, ignore and call with remainder
	in pre : case suf of 
		('\r':'\n':rest) -> splitLines rest 
		-- pattern match \r as first char, ignore and call with remainder so remoce chars and return pre:rest
                ('\r':rest)      -> splitLines rest 
		-- pattern match \n as first char, ignore and call with remainder. so remove char and return pre:rest
                ('\n':rest)      -> splitLines rest 
		-- default case, suf doesn't have a split? Everything should be in pre so... pre:[]
                _                -> [] 

isLineTerminator c = c == '\r' || c == '\n'


{-

-- What break is doing. Takes a func (t/f) and splits when first true
*Main> break odd [2,4,5,6,8]
([2,4],[5,6,8])
*Main> :module +Data.Char
*Main Data.Char> break isUpper "isUpper"
("is","Upper")
*Main Data.Char> (isUpper 'a')
False
*Main Data.Char> (isUpper 'A')
True


*Main> splitLines "Hello World"
["Hello World"]
*Main> splitLines "Hello\nWorld"
["Hello","World"]
*Main> splitLines "Hello\r\nWorld"
["Hello","World"]
*Main> splitLines "Hello\rWorld"
["Hello","World"]
*Main> splitLines "Hello\n\rWorld" -- wrong order...no match
["Hello","","World"]
*Main> splitLines "Hello\rWorld\r\nThere"
["Hello","World","There"]

-}
