import Data.Char (ord)
import Data.List

main :: IO ()
main = do
    contents <- readFile "data.txt"
    let groups = group_into 3 $ lines contents
        total = sum $ map (\x -> get_val $ foldr1 intersect x) groups
    print total

group_into :: Int -> [a] -> [[a]]
group_into _ [] = []
group_into 0 _  = []
group_into n l  = (take n l) : (group_into n (drop n l))

get_val :: [Char] -> Int
get_val (c:_) = if val >= 97 then val - 96 else val - 38  
    where val = ord c
get_val _ = 0