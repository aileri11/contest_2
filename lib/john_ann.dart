int johnDay(day){
  if(day == 0){
      return 0;
  }
  return day - annDay(johnDay(day-1));
}


int annDay(day){
  if(day == 0){
    return 1;
  }
  return day - johnDay(annDay(day-1));
}

List john(day){
  List schedule = [];
  for(int i = 0; i < day; i++){
    schedule.add(johnDay(i));
  }
  return schedule;
}

List ann(day){
  List schedule = [];
  for(int i = 0; i < day; i++){
    schedule.add(annDay(i));
  }
  return schedule;
}

int sumJohn(day){
  return john(day).reduce((a, b) => a + b);
}

int sumAnn(day){
  return ann(day).reduce((a, b) => a + b);
}