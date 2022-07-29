int divisitorsSum(int number){
  int sum = 1;
  for(int i = 2; i < number; i++){
    if(number % i == 0){
      sum += i;
    }
  }
  return sum;
}

List buddy(int start, int limit){
  for(int i = start; i < limit; i++){
      int m = divisitorsSum(i) - 1;
      if(m > i && divisitorsSum(m) == i + 1){
        return [i, m];
      }
  }
  return [null];
}