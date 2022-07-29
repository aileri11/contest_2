List josephusPermutation(List elements, step) {
  int length = elements.length;
  List loop = [...elements];
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
  return output;
}
