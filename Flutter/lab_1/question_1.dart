import 'dart:io';

void main(){
  print("Enter value of a : ");
  int a = int.parse(stdin.readLineSync()!);
  print("Enter value of b : ");
  int b = int.parse(stdin.readLineSync()!);
  print(a + b);
}