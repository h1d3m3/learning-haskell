f :: Int -> Int -> Int
f x y = x*x + y*y

main = print (f 2 3)


{-
$ runhaskell main.hs 
13
-}
