import 'dart:io';

void main(){
  print("Enter first number : ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second number : ");
  int num2 = int.parse(stdin.readLineSync()!);

  print("Enter third number : ");
  int num3 = int.parse(stdin.readLineSync()!);

  // if(num1 > num2){
  //   if(num1 > num3){
  //     print("num1 is largest number.");
  //   }
  //   else{
  //     print("num3 is largest number.");
  //   }
  // }
  //
  // if(num2 > num1){
  //   if(num2 > num3){
  //     print("num2 is largest number.");
  //   }
  //   else{
  //     print("num3 is largest number.");
  //   }
  // }

  int temp = (num1>num2) ? num1 : num2;

  int ans = (temp>num3) ? temp : num3;

  print("Largest number is : $ans");
}