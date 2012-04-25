-- import Data.Map as M
-- import Prelude
-- Concept -- This script is my cheat sheets for haskell.

-- function
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- pattern match
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- guard
factorial2 :: Int -> Int
factorial2 n | n == 0 = 0
             | otherwise = n * factorial2 (n - 1)

-- apply function to args
multiplyAll :: [Int] -> Int
multiplyAll [] = 1
multiplyAll (n:ns) = n * multiplyAll ns

max' :: [Int] -> Int
max' [a] = a
max' (x:xs) = max x (max' xs)

-- data
data Profile = Profile {name :: String,
                        age  :: Int }
             deriving(Read, Show, Eq)
-- Eq is used for types that support equality testing.
-- Ord is for types that have an ordering.
-- Enum members are sequentially ordered types.
-- Bounded members have an upper and a lower bound.
-- Num is a numeric typeclass.

-- custom comparing
instance Ord Profile where
  compare c1 c2 = compare (age c1) (age c2)


main = do
  -- show what is this
  putStrLn "This is my first Haskell program"
  print $ factorial2 6 -- print (factorial2 6)
                       -- print . factorial2 $ 6


  -- data instance
  let me = Profile "mizchi" 23
  let anonymouse = Profile "anonymouse" 3
  print me
  print . name $ me
  print $ me > anonymouse

  -- composition
  putStrLn . show $ factorial 6

  -- if
  print $ if 'a' > 'b' then 1 else 0
  print $ case (factorial 1) of 0 -> "newborn"
                                1 -> "infant"
                                _ -> "other"

  -- let in scope
  do
    let x = 4
        y = 5
        h:t = [3..8]
    print $ x * y + h * length t

  -- Cast
  print (5 :: Double)

  -- List
  print $ 1: [3..5]
  print $ [1] ++ [3..5]
  print $ sum [1..100]
  print $ [ if x < 10 then "BOOM!" else "BANG!" | x <- [1..10], odd x]

  print $ take 5 [1..]
  print $ 10 `take` cycle [1,2,3]
  print $ take 4 [(i,j)
          | i <- [1..2],j <- [3..5]]

  -- tuple
  print $ fst (1, 2)
  print $ zip [1..3] ["im","a","turtle"]

  -- anonymouse function
  print $ map (\x -> (*x) x) [1,2,3]

  -- partial apply
  print $ map (addThree 3 4) [1,2,3]
  print $ filter (\x -> if x `mod` 2 == 0 then True else False) [1..10]
  print $ foldl (+) 0 [1..10]
  print $ foldl1 (+) [1..10]

  print  "------ end here ------"
