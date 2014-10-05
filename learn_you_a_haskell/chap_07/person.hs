
data Person = Person {
	firstName :: String,
	lastName :: String,
	age :: Int,
	height :: Float,
	phoneNumber :: String,
	flavor :: String
} deriving (Show)


{-
*Main> :t flavor
flavor :: Person -> String
*Main> :t firstName
firstName :: Person -> String
*Main> :t Person
Person
  :: String -> String -> Int -> Float -> String -> String -> Person
*Main> Person "John" "Doe" 22 6.3 "123-123-1234" "strawberry"
Person {firstName = "John", lastName = "Doe", age = 22, height = 6.3, phoneNumber = "123-123-1234", flavor = "strawberry"
-}
