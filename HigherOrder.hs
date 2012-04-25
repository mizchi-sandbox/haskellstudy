max' :: [Int] -> Int
max' [a] = a
max' (x:xs) = max x (max' xs)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

main = do
  print $ max' [-9 .. -3]
  print $ zipWith' (+) [1,2,3] [3,4,5]
  print $ map (\x -> x) [1,2,3]
