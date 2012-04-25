module Main where
  qsort :: [Int] -> [Int]
  qsort [] = []
  qsort (x:xs) =
    (qsort (filter (<x) xs)) ++ [x] ++ (qsort (filter (>=x) xs))

  -- list
  qsort2 :: [Int] -> [Int]
  qsort2 [] = []
  qsort2 (x:xs) =
    qsort2 [a | a <-xs , a < x] ++ [x] ++ qsort2 [a | a <-xs , a >= x]

  main = do
    print (qsort [5,6,1,35,324,1342,234,2,432])

