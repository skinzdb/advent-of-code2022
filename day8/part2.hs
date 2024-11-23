import Data.Char (ord)
import Data.List (transpose)

main :: IO ()
main = 
    do contents <- readFile "data.txt"
       let rs  = map (map (\x -> ord x - 48)) $ lines contents
           rs' = transpose rs
           rows = length rs 
           cols = length (head rs)

           idxs = concatMap (\i -> map (\j -> (i, j)) [0 .. cols - 1]) [0 .. rows - 1] 
           
           scores = map (\(i, j) -> visible (drop j (rs !! i)) *
                                    visible (reverse $ take (j+1) (rs !! i)) *
                                    visible (drop i $ (rs' !! j)) * 
                                    visible (reverse $ take (i+1) (rs' !! j))) idxs
       print $ maximum scores

visible :: [Int] -> Int
visible [] = 0
visible (x:xs) = let (as, bs) = span (< x) xs
                 in length as + length (take 1 bs)

