module Main where

import Data.List (elemIndex, findIndex)

oddNumbers = filter odd [1..200] -- Find the largest Mersenne prime < 200.

mersenneify n = (2^n) - 1
possibleMersennePrimes = map (mersenneify) oddNumbers
checkCondition possiblePrime = sqrt(possiblePrime) if
mersennePrimes = map (checkCondition) possibleMersennePrimes
-- Rather then generate a list of all primes, we just want possible
-- Mersenne Primes, so rather than be ineffeicent and generate primes and find
-- the Mersenne Prime, we just use the 2^n - 1 case.
{-
primes = 2 : 3 : 5 : primes'
  where
      isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
      primes' = 7 : filter (isPrime primes') (scanl (+) 11 $ cycle [2,4,2,4,6,2,6,4])
-}

finitePrimes = takeWhile (< 2147483647) primes -- Generating ~10 digit primes, takes awhiles around ~162 minutes benchmarked.
hit element = element `elem` finitePrimes
value = map (hit) possibleMersennePrimes

-- getMersenne n = findIndex (n `elem` possibleMersennePrimes)
-- [n | x <- xs, n <- x]

-- gimmeMersenneIndex = elemIndex 31 possibleMersennePrimes
-- findStuff = findIndex (`elem` possibleMersennePrimes) primes

main = do
    putStrLn "A list of odd numbers, since there is only one Mersenne prime with and even exponent."
    print (oddNumbers)
    putStrLn "Raise each element in our odd numbers list to get a list of possible Mersenne primes."
    print (possibleMersennePrimes)
    print (finitePrimes)
    putStrLn "\n"
