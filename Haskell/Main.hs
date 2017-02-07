module Main where

import Data.List (elemIndices)
import Math.NumberTheory.Primes.Testing

oddNumbers = [1,3..1000000]
possibleMersennePrimes = [2^n - 1 | n <- oddNumbers]

locationOfMersennePrimes = map isPrime possibleMersennePrimes

elementLocationsOfPrimes = elemIndices True locationOfMersennePrimes
thePrimeMakingExponents = [oddNumbers !! n | n <- elementLocationsOfPrimes]
theMersennePrimes = [2^n - 1 | n <- elementLocationsOfPrimes]

main = do
    putStrLn "A list of odd numbers, since there is only one Mersenne prime with and even exponent."
    putStrLn "Raise each element in our odd numbers list to get a list of possible Mersenne primes."
    putStrLn "Found primes: "
    print (theMersennePrimes)
    putStrLn "Their exponents: "
    print (thePrimeMakingExponents)
    putStrLn "\n"
