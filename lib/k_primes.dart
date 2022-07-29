int primeFactorsCounter(num number){
  int counter = 0;
  while(number % 2 == 0){
    number = number / 2;
    counter++;
  }
  for (int i = 3; i <= number; i += 2){
    while (number % i == 0){
      number = number / i;
      counter++;
    }
  }
  return counter;
}

List countKPrimes(int k, int start, int end){
  List<int> kPrimes = []; 
  for(int i = start; i <= end; i++){
    if(k == primeFactorsCounter(i)){
      kPrimes.add(i);
    }
  }
  return kPrimes;
}

int puzzle(int number){
  List aNumbers = countKPrimes(1, 1, number);
  List bNumbers = countKPrimes(3, 1, number);
  List cNumbers = countKPrimes(7, 1, number);
  int counter = 0;
  for(int i = 0; i < cNumbers.length; i++){
    cNumbers[i] = number - cNumbers[i];
  }
  for(int cNumber in cNumbers){
    for(int j = 0; j < bNumbers.length; j++){
      bNumbers[j] = cNumber - bNumbers[j];
      for(int aNumber in aNumbers){
        if(aNumber == bNumbers[j]){
          counter++;
        }
      }
    }
  }
  return counter;
}
