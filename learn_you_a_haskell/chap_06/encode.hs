import Data.Char

-- take an offset and a string
encode :: Int -> String -> String
-- over each char, get the ord, add the offset, back to char
encode offset msg = map (\c -> chr $ ord c + offset) msg

-- Going the other way
decode :: Int -> String -> String
decode offset msg = encode (negate offset) msg


{-
*Main> encode 3 "hello world"
"khoor#zruog"
-}
