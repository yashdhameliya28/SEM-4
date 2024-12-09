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

  print("Percentage : ${((subject1 + subject2 + subject3 + subject4 + subject5)/500)*100}");
}