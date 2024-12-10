//WAP to generate Fibonacci series of N given number using method.

import 'dart:io';

void main(){
  print("Enter a number : ");
  int n = int.parse(stdin.readLineSync()!);
  int num1 = 0;
  int num2 = 1;
  int num3 = 0;
  print_series(n, num1, num2, num3);
}

void print_series(int n,  int num1 , int num2 , int num3){
  for(int i = 1 ; i <= n ; i++){
    num3 = num1 + num2;
    stdout.write("$num3+");
    num1 = num2;
    num2 = num3;
  }
}