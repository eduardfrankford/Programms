mergelists [] [] = []
mergelists [] (x:xs) = (x:xs)
mergelists (x:xs) [] = (x:xs)
mergelists (x:xs) (y:ys) = x : [y] ++ mergelists xs ys