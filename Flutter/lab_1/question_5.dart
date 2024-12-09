import 'dart:io';

void main(){
  print("Enter your weight in kilogram : ");
  int weight = int.parse(stdin.readLineSync()!);
  double weightp = weight * (.453559237);
  print("Enter your height in meter : ");
  int height = int.parse(stdin.readLineSync()!);
  double heighti = height * .254;
  print("weight in kilogram and height in meter");
  print("Your BMI is : ${weight/(height * height)}");
  print("weight in pound and height in inches");
  print("Your BMI is : ${703 * (weightp/(heighti * heighti))}");
}