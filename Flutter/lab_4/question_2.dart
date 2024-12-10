// WAP to find maximum number from given two numbers using method.

import 'dart:io';
import 'dart:math';

void main(){
  print("Enter first number : ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second number : ");
  int num2 = int.parse(stdin.readLineSync()!);

  print("Maximum number : ${max_number(num1, num2)}");
}

int max_number(int num1 , int num2){
  return num1 > num2 ? num1 : num2;
}