module Main where

import Data.List (elemIndices)
import Math.NumberTheory.Primes.Testing

-- Only known Mersenne prime for a even exponent is 2.
oddNumbers = [2] ++ [1,3..1024] 
possibleMersennePrimes = [2^n - 1 | n <- oddNumbers]

locationOfMersennePrimes = map isPrime possibleMersennePrimes

elementLocationsOfPrimes = elemIndices True locationOfMersennePrimes
thePrimeMakingExponents = [oddNumbers !! n | n <- elementLocationsOfPrimes]
theMersennePrimes = [2^n - 1 | n <- thePrimeMakingExponents]

formattedList = [n | n <- zip thePrimeMakingExponents theMersennePrimes]

display :: (Show a, Show b) => (a, b) -> String
display (a, b) = "2^" ++ show a ++ "  - 1 has the prime result of " ++ show b


main = do
    putStrLn "A list of odd numbers, since there is only one Mersenne prime with and even exponent."
    putStrLn "Raise each element in our odd numbers list to get a list of possible Mersenne primes."
    mapM_ putStrLn $ map display formattedList
