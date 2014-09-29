-- function where the first two params (a,b), returns c
-- becomes function that reorders the parameters to (b,a) returns c
flip' :: (a -> b -> c) -> (b -> a -> c)
-- takes a function
-- return g which has become f (y,x)
flip' f = g
	where g x y = f y x


{-
*Main> zip [1,2,3,4,5] "hello"
[(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
*Main> flip' zip [1,2,3,4,5] "hello"
[('h',1),('e',2),('l',3),('l',4),('o',5)]

*Main> zipWith div [2,2..] [10,8,6,4,2]
[0,0,0,0,1]
*Main> zipWith (flip' div) [2,2..] [10,8,6,4,2]
[5,4,3,2,1]
-}
