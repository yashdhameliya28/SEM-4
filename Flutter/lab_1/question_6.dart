import 'dart:io';
void main() {
  var factor = [2,3,5];
  print("Enter a number :");
  int number = int.parse(stdin.readLineSync()!);
  for(int i = 0;i<factor.length;i++) {
    while (number % factor[i] == 0) {
      number = number ~/ factor[i];
    }
  }
  if(number == 1){
    print("it is ugly number");
  }
  else{
    print("not ugly");
  }

}