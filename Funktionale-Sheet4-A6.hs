module StackCal where
    
    type Stack a = [Int]
    empty = []
    push x s = x : s
    pop s = (head s, tail s)

    data Cmd = Push Int
        | Pop
        | Add 
        deriving(Eq,Show,Read)


    exec :: Cmd -> Stack Int -> Stack Int
    exec (Push a) []= a : []
    exec (Push a) (x:xs)= a : (x:xs)
    exec Pop (x:xs)= snd $ pop (x:xs)
    exec Add (x:xs) =  z : y
        where 
            z = (x) + head xs
            y = exec Pop (exec Pop (x:xs))



    {-addLineNumber input = x
        where
            x = [show(z) ++ " " ++ y | y <- input, z <- [1..length(input)]]-}



    getUserInputs stack = do
        print ("stack: " ++ show(stack))
        input <- getLine
        if null input then return()
        else do
            let cmd = getCommand $ words input
            mulInputs <- getUserInputs $ exec (cmd) stack
            return()

    getCommand input
        | null input = error "no such a command"
        | input!!0 == "Push" = Push (read (input!!1) :: Int)
        | input!!0 == "Pop" = Pop
        | input!!0 == "Add" = Add :: Cmd
    
    
    main :: IO ()
    main = do
        putStrLn "Greetings! Let me calc your input!"
        getUserInputs empty