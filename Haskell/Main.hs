module Main where

import Data.List (elemIndices)
import Math.NumberTheory.Primes.Testing

oddNumbers = [1,3..256]
possibleMersennePrimes = [2^n - 1 | n <- oddNumbers]

locationOfMersennePrimes = map isPrime possibleMersennePrimes

elementLocationsOfPrimes = elemIndices True locationOfMersennePrimes
thePrimeMakingExponents = [oddNumbers !! n | n <- elementLocationsOfPrimes]
theMersennePrimes = [2^n - 1 | n <- thePrimeMakingExponents]

formattedList = [n | n <- zip thePrimeMakingExponents theMersennePrimes]

main = do
    putStrLn "A list of odd numbers, since there is only one Mersenne prime with and even exponent."
    putStrLn "Raise each element in our odd numbers list to get a list of possible Mersenne primes."
    display formattedList
    print (thePrimeMakingExponents)
    print (theMersennePrimes)
    putStrLn "\n"
