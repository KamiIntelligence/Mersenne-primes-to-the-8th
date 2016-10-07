#include <iostream>
#include "BigIntegerLibrary.hh"
#include <vector>

/* Non-scalable for BigNum values, use GMP mpz_ui_pow_ui if you need bigger. */
BigUnsigned integerOrder(int base, int order)
{ int r = 1;
  while (order--)
    r *= base;
  return static_cast<BigUnsigned>(r);
}

/* The algorithm in isPrime is broken.
 * Broken in the sense of:
 * 2 is not prime.
 * 1 is prime
 * Assume primes are all odd.
 * Oh, and the efficiency of the algorithm is completely dependent on how big
 * possiblePrime gets. It beats the sqrt(possiblePrime) in benchmarks. */
bool isPrime(BigUnsigned possiblePrime)
{ for (BigUnsigned i = 3; i * i <= possiblePrime; i += 2)
  { if (possiblePrime % i == 0)
    return false;
  }
  return true;
}

int main(void)
{
  for (int i = 2; i <= 100; i++)
  {
    if ((i & 1) == 1 || i == 2)
    { BigUnsigned temp = (integerOrder(2, i) - 1);
	  if (isPrime(temp))
		  std::cout << "2^" << i << " - 1 is prime: " << temp << std::endl;
    }
  }
  std::cout << "Press enter to quit...";
  std::getwchar();
  return 0; /* C++11 automatically does this, however... */
}
