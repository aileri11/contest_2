import 'package:test/test.dart';

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

int ann(day){
  if(day == 0){
    return 1;
  }
  return day - john(ann(day-1));
}

int john(day){
  if(day == 0){
      return 0;
  }
  return day - ann(john(day-1));
}

List johnList(day){
  List schedule = [];
  for(int i = 0; i < day; i++){
    schedule.add(john(i));
  }
  return schedule;
}

List annList(day){
  List schedule = [];
  for(int i = 0; i < day; i++){
    schedule.add(ann(i));
  }
  return schedule;
}

int sumJohn(day){
  return johnList(day).reduce((a, b) => a + b);
}

int sumAnn(day){
  return annList(day).reduce((a, b) => a + b);
}

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

int perimeter(num numOfSquaires){
  List<int> fibonacci = [1, 1];
  if(numOfSquaires == 1){
    return 4;
  }
  while(fibonacci.length <= numOfSquaires){
    fibonacci.add(fibonacci.last + fibonacci.elementAt(fibonacci.length - 2));
  }
  return 4*fibonacci.reduce((a, b) => a + b);
}

void main() {
  test('task_3', (){
    print(countKPrimes(5, 500, 600));
  });
  test('task_3(puzzle)', () {
    print(puzzle(143));
  });
  test('task_4', () {
    print(gap(2, 5, 5));
  });
  test('task_5', () {
    print(annList(6));
    print(sumJohn(75));
  });
  test('task_6', () {
    print(primesInNumbers(86240));
  });
  test('task_7', (){
    print(perimeter(7));
  });
}