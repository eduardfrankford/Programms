iterate f x = x : iterate f (f x)
tail (_:xs) = xs
take n xs | n <= 0 || null xs = []
take n (x:xs) = x : take (n-1) xs

take 4 (iterate tail [1..3]) = take 4([1,2,3]:iterate tail [2,3]) = take 4([1,2,3]:[2,3]: iterate tail [3]) = take 4([1,2,3]:[2,3]:[3]: iterate tail []) = take 4([1,2,3]:[2,3]:[3],[])
=  take 4([1,2,3]:[2,3]:[3]:[]) = [1,2,3] : take (3) ([2,3]:[3]:[]) = [1,2,3] : [2,3] : take (2) [3]:[] = [1,2,3] : [2,3] : [3] : take 1 [] = [1,2,3] : [2,3] : [3] : [] take 0 null = 
    [1,2,3] : [2,3] : [3] : [] as 0 <= 0 

