import 'dart:io';

void main(){
  print("Enter a number : ");
  int a = int.parse(stdin.readLineSync()!);

  if(a > 0){
    print("Given number is positive.");
  }
  else{
    print("Given number is negative.");
  }
}