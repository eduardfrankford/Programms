import System.Environment

foreach :: [a] -> (a -> IO ()) -> IO ()
foreach [] io     = return ()
foreach (a:as) io = do {io a; foreach as io}

main = do
  files <- getArgs
  if null files then interact id else do
    foreach files readAndPrint
    where readAndPrint file = do
            s <- readFile file
            putStr s
