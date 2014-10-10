-- Tree type is empty or contains a node that has left and right trees
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)


-- Build a single element tree
singleton :: a -> Tree a
singleton x = Node x (EmptyTree) (EmptyTree)

-- takes a ord value and a tree to insert into, returns tree
treeInsert :: (Ord a) => a -> Tree a -> Tree a
-- If the tree we're putting into is empty, get a new one with the value we want to insert
treeInsert x EmptyTree = singleton x
-- match on non-empty tree and value
treeInsert x (Node a left right)
	-- just replace in the same place
	| x == a = Node x left right
	-- insert value is less than existing, recurse into left
	| x < a = Node a (treeInsert x left) right
	-- insert value is more than existing, recurse into right
	| x > a = Node a left (treeInsert x right)


treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False -- not found
treeElem x (Node a left right)
	| x == a = True -- found
	| x > a = treeElem x right -- look right (bigger)
	| x < a = treeElem x left -- less than

{-
*Main> let nums = [8,6,4,1,7,3,5,5,5] 
*Main> let numsTree = foldr treeInsert EmptyTree nums
*Main> numsTree 
Node 5 (Node 3 (Node 1 EmptyTree EmptyTree) (Node 4 EmptyTree EmptyTree)) (Node 7 (Node 6 EmptyTree EmptyTree) (Node 8 EmptyTree EmptyTree))
*Main> treeElem 5 numsTree 
True
*Main> treeElem 99 numsTree 
False
-}
