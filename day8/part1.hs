import Data.Char (ord)
import Data.List (transpose)

main :: IO ()
main = 
    do contents <- readFile "data.txt"
       let rs = map (map (\x -> ord x - 48)) $ lines contents
           rows = length rs 
           cols = length (head rs)

           vLeft = concatMap visible rs
           vRight = concatMap (reverse . visible . reverse) rs
           vTop = concat $ transpose $ map visible (transpose rs)
           vBottom = concat $ transpose $ map (reverse . visible . reverse) (transpose rs)

           vis = filter (\((l,r),(t,b)) -> l || r || t || b) (zip (zip vLeft vRight) (zip vTop vBottom))
       putStrLn $ show $ length vis 

visible :: [Int] -> [Bool]
visible = vis (-1) 
    where
        vis _ [] = []
        vis x (y:ys) = (y > x) : vis (max x y) ys


