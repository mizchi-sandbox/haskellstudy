module Main where
  qsort :: [Int] -> [Int]
  qsort [] = []
  qsort (x:xs) =
    (qsort (filter (<x) xs)) ++ [x] ++ (qsort (filter (>=x) xs))

  main = print (qsort [5,6,1,35,324,1342,234,2,432])
