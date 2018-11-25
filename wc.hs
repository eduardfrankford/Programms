count s = ns ++ "  " ++ ws ++ "  " ++ bs ++ "\n"
  where ns = show (length (lines s))
        ws = show (length (words s))
        bs = show (length s)

main = interact count
