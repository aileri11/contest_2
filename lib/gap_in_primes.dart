bool isPrime(int number){
  for (var i = 2; i <= number / i; ++i) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

List gap(int gapSize, int start, int end){
  List<int> primeNumbers = [];
  for(int i = start; i < end + 1; i++){
    if(isPrime(i) == true){
      primeNumbers.add(i);
    }
  }
  List<int> firstGap = [];
  for(int i = 0; i < primeNumbers.length - 1; i++){
    if(primeNumbers[i+1] - primeNumbers[i] == gapSize){
      firstGap.add(primeNumbers[i]);
      firstGap.add(primeNumbers[i + 1]);
      return firstGap;
    }
  }
  return firstGap;
}