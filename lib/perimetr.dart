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