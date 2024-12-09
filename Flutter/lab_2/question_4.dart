import 'dart:io';

void main(){
  print("Enter mark of 1st subject out of 100 :");
  int subject1 = int.parse(stdin.readLineSync()!);

  print("Enter mark of 2nd subject out of 100 :");
  int subject2 = int.parse(stdin.readLineSync()!);

  print("Enter mark of 3rd subject out of 100 :");
  int subject3 = int.parse(stdin.readLineSync()!);

  print("Enter mark of 4th subject out of 100 :");
  int subject4 = int.parse(stdin.readLineSync()!);

  print("Enter mark of 5th subject out of 100 :");
  int subject5 = int.parse(stdin.readLineSync()!);

  double percantage = ((subject1 + subject2 + subject3 + subject4 + subject5)/500)*100;

  print(percantage);

  if(percantage < 35){
    print("you fail!!!!!!");
  }

  else if(percantage > 35 && percantage < 45){
    print("you are pass.");
  }

  else if(percantage >= 45 && percantage < 60){
    print("second class.");
  }

  else if(percantage >= 60 && percantage < 70){
    print("First class.");
  }

  else{
    print("Distinction class.");
  }
}