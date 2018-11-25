main :: IO ()
main = do
  putStrLn "Greetings! Let me echo your input!"
  getUserInputs 1


{-addLineNumber input = x
    where
        x = [show(z) ++ " " ++ y | y <- input, z <- [1..length(input)]]-}



getUserInputs n = do
  input <- getLine
  if null input then return ()
  else do
    print (show(n) ++ ": " ++ input)
    mulInputs <- getUserInputs $ n+1
    return()