# CS1200 - Calculate the 8th Mersenne prime.

The given MATLAB code is as such:
```MATLAB
clear ; clc ; close all ; format compact ;

tol = 1e-10;
nlimit = 2000000000;

primelist = primes(nlimit);
nprimes = length(primelist)
fprintf('\n');
mcount = 0;
for i=1:nprimes,
  twopow = log2(primelist(i)+1);
  if abs(twopow-round(twopow))<tol
    mcount = mcount + 1;
    fprintf('%7d %7d is a Mersenne prime with 2 exp of %4d\n',...
    mcount,primelist(i),twopow);
  end
end
twopow
```

#### Hypothesis:
The function call of primes(nlimit) is a contributor to the slow down, since
it is generating all primes, not just Mersenne primes; however, the main
cause for the slow down is the part of the code checks each prime for
it's possible Mersenne counter part (2^n - 1).

#### What I plan to try:
Mersenne primes only have appeared with a odd exponent with the exception of:
2^2 - 1 = 3. So I will generate a list/vector/array
(whatever it is called in the language I decide to use) with the follow idea:
```Haskell
oddNumbers = filter odd [1..200]
mersenneify n = (2^n) - 1
possibleMersennePrimes = map (mersenneify) oddNumbers
```
i.e. list of odd numbers raised to the order of two
then minus one. After that test each element with the
square root method talked about in the class.

#### How it all works (each function explained, and some algorithm talk):
integerOrder - takes, a base and a order. The reason for this is due to the
cmath library function called pow does not return unsigned long long int.

isPrime - returns a boolean value whether the number passed to it is prime
or not prime. Due to the cmath sqrt function not being able to handle how
large our numbers can become, it is useless. Rather than implement one that
can handle such a number, I check using i times i <= possiblePrime, as it is
essentially the same as sqrt(possiblePrime) and check if anything below
sqrt(possiblePrime) divides evenly into possiblePrime.

main - contains two vectors, one to hold a collection of possible generated
Mersenne primes based on that n is only ever odd with the exception to 2. (This
is the possibleMersennePrimes vector.) The vector called exponents, holds the
odd exponents used to generate the possibleMersennePrimes vector, this is for
easy outputing which exponents was used to generate the Mersenne prime.

#### Why does it work (faster):
0. Does not generate even n exponents (other than 2) which no prime has
reportedly been generated from.
1. Does less units of work. (i.e. does not calculate (2^n) - 1, then check the
value against a fully generated prime list, having to search through a larger
collection.)