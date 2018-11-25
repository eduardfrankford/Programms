main :: IO ()
main = do
  putStrLn "Greetings! What's your name?"
  name <- getLine
  putStrLn ("Welcome to Haskell's IO, " ++ name ++ "!")
