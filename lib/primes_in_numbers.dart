String primesInNumbers(num number){
  Map primes = {};
  int counter = 0;
  while(number % 2 == 0){
    number = number / 2;
    counter++;
  }
  primes['2'] = counter;
  for (int i = 3; i <= number; i += 2){
    counter = 0;
    while (number % i == 0){
      number = number / i;
      counter++;
    }
    if(counter != 0){
      primes['$i'] = counter;
    }
  }
  String primeFactorization = '';
  primes.forEach((key, value) {
    if(value > 1){
      primeFactorization += '($key**$value)';
    }
    else{
      primeFactorization += '($key)';
    }
  });
  return primeFactorization;
}