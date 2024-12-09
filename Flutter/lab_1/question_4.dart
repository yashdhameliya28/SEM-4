import 'dart:io';

void main(){
  print("Enter meter value :");
  int meter = int.parse(stdin.readLineSync()!);
  print("Feet is ${meter * 3.28}");
}