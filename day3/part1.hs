import Data.Char (ord)

main :: IO ()
main = do
    contents <- readFile "data.txt"
    let backpacks = lines contents
        total = sum $ map (\x -> get_item (take ((length x) `div` 2) x) (drop ((length x) `div` 2) x)) backpacks
    print total

get_item :: [Char] -> [Char] -> Int
get_item (x:xs) ys
    | find x ys = get_val x
    | otherwise = get_item xs ys
get_item _ ys = 0

find :: Char -> [Char] -> Bool
find _ [] = False
find x (y:ys)
    | x == y    = True
    | otherwise = find x ys

get_val :: Char -> Int
get_val c = if val >= 97 then val - 96 else val - 38  
    where val = ord c