-- Get next to last item of a list
lastButOne :: [a] -> a

-- take last item off of xs (next to last is now last), then last 
lastButOne xs = last (take ((length xs) - 1) xs)
