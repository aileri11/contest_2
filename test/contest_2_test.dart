import 'package:test/test.dart';

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
      print(m);
      if(m > i && divisitorsSum(m) == i + 1){
        return [i, m];
      }
  }
  return [null];
}

num getFirstNum(List expr){
  if(expr[0] != '+' && expr[0] != '-'){
    num sum = num.parse(expr[0]);
    return sum;
  }
  else if(expr[0] == '+'){
    num sum = num.parse(expr[1]);
    return sum;
  }
  else{
    num sum = -1 * num.parse(expr[1]);
    return sum;
  }
}

String pasteSplitPattern(String expression){
  List<String> operators = ['+', '-', '*', '/'];
  for(var operator in operators){
    expression = expression.replaceAll(operator, '#$operator#');
  }
  return expression;
}

List<String> destroyMultipleSigns(List<String> exprList){
  for(int i = 0; i < exprList.length - 1; i++){
    if(exprList[i] == '+' || exprList[i] == '-'){
      while(exprList[i+1] == '+' || exprList[i+1] == '-'){
        if(exprList[i] == '+'){
          exprList.removeAt(i);
        }
        if(exprList[i] == '-' && exprList[i + 1] == '-'){
          exprList.removeAt(i);
          exprList[i] = '+';
        }
        if(exprList[i] == '-' && exprList[i + 1] == '+'){
          exprList.removeAt(i+1);
        }
      }
    }
  }
  return exprList;
}

num solveExpression(String expr){
  expr = pasteSplitPattern(expr);
  List<String> exprList = expr.replaceAll(' ', '').replaceAll('##', '#').split('#');
  if(exprList[0] == ''){
    exprList.removeAt(0);
  }
  exprList = destroyMultipleSigns(exprList);
  num sum = getFirstNum(exprList);
  for(int i = 1; i < exprList.length; i++){
    if(exprList[i - 1] != '+' && exprList[i - 1] != '-' && exprList[i - 1] != ''){
      if(exprList[i - 1] != '*' && exprList[i - 1] != '/'){
        if(exprList[i] == '+'){
          sum = sum + num.parse(exprList[i+1]);
        }
        if(exprList[i] == '-'){
          sum = sum - num.parse(exprList[i+1]);
        }
      }
      if(exprList[i] == '/'){
        if(exprList[i + 1] == '-'){
          sum = sum / -num.parse(exprList[i+2]);
        }
        else if(exprList[i + 1] == '+'){
          sum = sum / num.parse(exprList[i+2]);
        }
        else{
          sum = sum / num.parse(exprList[i+1]);
        }
      }
      if(exprList[i] == '*'){
        if(exprList[i + 1] == '-'){
          sum = sum * -num.parse(exprList[i+2]);
        }
        else if(exprList[i + 1] == '+'){
          sum = sum * num.parse(exprList[i+2]);
        }
        else{
          sum = sum * num.parse(exprList[i+1]);
        }
      }
    }
  }
  return sum;
}

String openBrackets(String expression){
  while (expression.lastIndexOf('(') != -1){
    String openBracket = expression.substring(expression.lastIndexOf('('));
    String wholeBracket = openBracket.substring(openBracket.lastIndexOf('(') + 1, 
      openBracket.indexOf(')'));
    String bracketOperationResult = solveExpression(wholeBracket).toString();
    expression = expression.replaceAll('($wholeBracket)', bracketOperationResult);
  }
  return expression;
}

void main() {
  test('task_1 josephus', () {
    List<int> elements = [1, 2, 3];
    int length = elements.length;
    int step = 3;
    List<int> loop = [...elements];
    List output = [];
    for(int i = 1; i < length + 1; i++){
      if(elements.length < 3){
        output += elements;
        break;
      }
      while(step * i > loop.length){
        loop += elements;
      }
      output.add(loop[step* i - 1]);
      elements.remove(output[i - 1]);
    }
    print(output);
  });
  test('task_2', () {
    print(buddy(10, 50));
  });
  test('obligatory task', (){
    String expression = '-2*2';
    print(solveExpression(expression));
    //(...(...)...(...)...) ... (...)
  });
  test('regexp', () {
    String test = '-(4)';
    print(openBrackets(test));
  });
  test('expression test', () {
    String test = '(2 / (2 + 3.33) * 4) - -6';
    print(solveExpression(openBrackets(test)));
  });
  test('isValid?', () {
    String test = '1 - - 1';
    List testArray = test.split(' ');
    for(int i = 0; i < testArray.length; i++){
      if(testArray[i].length > 2){
        if(testArray[i].substring(testArray[i].length - 1) == '-'){
          print('Invalid');
        }
      }
    }
    for(int i = 1; i < testArray.length; i++){
      if((testArray[i-1].substring(testArray[i-1].length - 1) == '-' || testArray[i-1].substring(testArray[i-1].length - 1) == '+')
          && (testArray[i] == '-' || testArray[i] == '+')){
        print('Invalid');
      }
      if((testArray[i-1] == '-' || testArray[i-1] == '+') && (testArray[i] == '-' || testArray[i] == '+')){
        print('Invalid');
      }
    }
  });
  test('multiple signs', (){
    List<String> l = ['-', '-','6', '+', '-', '-', '4'];
    print(destroyMultipleSigns(l));
  });
  test('task_3', (){

  });
}
