module Calc where

    type Stack a = [Int]
    empty = []
    push x s = x : s
    pop s = (head s, tail s)

    data Cmd = Push Int
        | Pop
        | Add 
        deriving(Eq,Show,Read)

    getA (Push a) = a


    exec :: Cmd -> Stack Int -> Stack Int
    exec cmd stack
        | cmd == (Push x) = push (getA(cmd)) $ stack
        | cmd == Pop = snd $ pop $ stack
        | cmd == Add = z : stack
        | otherwise = error("error")
            where 
                x = fst $ pop stack
                y = fst $ pop stack
                z = x + y


    {-exec :: Cmd -> Stack Int -> Stack Int
    exec (Push a) (x:xs)= a : (x:xs)
    exec Pop (x:xs)= snd $ pop (x:xs)
    exec Add (x:xs) =  z : y
        where 
            z = (x) + head xs
            y = exec Pop (exec Pop (x:xs))-}

