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
  for(int i = 1; i < exprList.length; i++){
    if(exprList[i - 1] != '+' && exprList[i - 1] != '-' && exprList[i - 1] != ''){
      if(exprList[i] == '/'){
        if(exprList[i + 1] == '-'){
          exprList[i] = (num.parse(exprList[i - 1]) / - num.parse(exprList[i + 2])).toString();
          exprList.removeAt(i+2);
        }
        else if(exprList[i + 1] == '+'){
          exprList[i] = (num.parse(exprList[i - 1]) / num.parse(exprList[i + 2])).toString();
          exprList.removeAt(i+2);
        }
        else{
          exprList[i] = (num.parse(exprList[i - 1]) / num.parse(exprList[i + 1])).toString();
        }
        exprList.removeAt(i+1);
        exprList.removeAt(i-1);
        i = i - 1;
      }
      else if(exprList[i] == '*'){
        if(exprList[i + 1] == '-'){
          exprList[i] = (num.parse(exprList[i - 1]) * - num.parse(exprList[i + 2])).toString();
          exprList.removeAt(i+2);
        }
        else if(exprList[i + 1] == '+'){
          exprList[i] = (num.parse(exprList[i - 1]) * num.parse(exprList[i + 2])).toString();
          exprList.removeAt(i+2);
        }
        else{
          exprList[i] = (num.parse(exprList[i - 1]) * num.parse(exprList[i + 1])).toString();
        }
        exprList.removeAt(i+1);
        exprList.removeAt(i-1);
        i = i - 1;
      }
    }
  }
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

bool validation(String expr){
  List exprArray = expr.split(' ');
  for(int i = 0; i < exprArray.length; i++){
    if(exprArray[i].length > 2){
      if(exprArray[i].substring(exprArray[i].length - 1) == '-'){
        return false;
      }
    }
  }
  for(int i = 1; i < exprArray.length; i++){
    if((exprArray[i-1].substring(exprArray[i-1].length - 1) == '-' || exprArray[i-1].substring(exprArray[i-1].length - 1) == '+')
        && (exprArray[i] == '-' || exprArray[i] == '+')){
      return false;
    }
    if((exprArray[i-1] == '-' || exprArray[i-1] == '+') && (exprArray[i] == '-' || exprArray[i] == '+')){
      return false;
    }
  }
  return true;
} 

String evaluateMathematicalExpr(String expr){
  if(validation(expr) == true){
    return(solveExpression(openBrackets(expr)).toString());
  }
  else{
    return 'Invalid';
  }
}