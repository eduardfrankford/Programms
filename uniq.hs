import Data.List

main = interact (unlines . nub . lines)
