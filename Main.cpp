#include <iostream>
/* #include <gmpxx.h>
 * I use intergers larger than unsigned long long.
 * - Never mind I forgot just how abhorrant the GMP interface for C++ is.
 * Ergo doing the bare minimum calculating the 8th Mersenne prime. */
#include <vector>

/* Non-scalable for BigNum values, use GMP mpz_ui_pow_ui if you need bigger. */
unsigned long long int integerOrder(int base, int order)
{
  unsigned long long int r = 1;
  while (order--)
    r *= base;
  return r;
}

/* The algorithm in isPrime is broken.
 * Broken in the sense of:
 * 2 is not prime.
 * 1 is prime
 * Assume primes are all odd.
 * Oh, and the efficiency of the algorithm is completely dependent on how big
 * possiblePrime gets. It beats the sqrt(possiblePrime) in benchmarks. */
bool isPrime(unsigned long long int possiblePrime)
{ for (unsigned long long int i = 3; i * i <= possiblePrime; i += 2)
  { if (possiblePrime % i == 0)
    return false;
  }
  return true;
}

int main(void)
{
  /* Vectors to store our data, GMP does not implement nicely into them ergo
   * if you want to use GMP, const sized arrays are your friend. */
  std::vector<unsigned long long int> possibleMersennePrimes;
  std::vector<int> exponents;
  for (int i = 2; i <= 63; i++) /* 2^61 - 1 calculates the 8th Mersenne Prime,
                                 * higher, and beyond use GMP.
                                 * The max capable with primative data types is:
                                 * 18446744073709551615
                                 * which is < 618970019642690137449562111.
                                 * Though one of course could be like
                                 * C programmers and use char[] for everything.
                                 */
  {
    if (i & 1 == 1 || i == 2) /* Mersenne Primes have not appeared for even
                               * numbers (except 2), so this speeds up some computation.*/
    { unsigned long long int temp = (integerOrder(2, i) - 1);
      possibleMersennePrimes.push_back(temp);
      exponents.push_back(i); /* So we can tell the user what Mersenne prime. */
    }
  }
  /* Output, aka listing what is and is not primes to the terminal/console. */
  std::cout << "A list of our possible Mersenne primes: " << std::endl;
  for (unsigned int i = 0; i < possibleMersennePrimes.size(); i++)
  {
    if (isPrime(possibleMersennePrimes[i]))
      std::cout << "2^" << exponents[i] << " - 1 is prime: "
                << possibleMersennePrimes[i] << std::endl;
    else
      std::cout << "2^" << exponents[i] << " - 1 is NOT prime: "
                << possibleMersennePrimes[i] << std::endl;
  }
  return 0; /* C++11 automatically does this, however... */
}
