// WAP to accept n numbers in an array. Display the sum of all the numbers which are divisible
// by either 3 or 5.

import 'dart:io';

class Number{
  List<int> numbers = [];

  void addNumbers(int num){
    numbers.add(num);
  }

  void checkNumDivideBy3or5(){
    for(int i = 0 ; i < numbers.length ; i++){
      int temp = numbers[i];
      for(int j = 1 ; j < numbers.length - 1 ; j++){
        int sum = temp + numbers[j];
        if(sum % 3 == 0 || sum % 5 == 0){
          print(sum);
        }
      }
    }
  }
}

void main(){
  Number n1 = Number();
  int n;
  do{
    print("1. Insert number."
    "\n2. Find number"
    "\n3. For exit Program");
    n = int.parse(stdin.readLineSync()!);

    switch (n){
      case 1:
        print("Enter a number");
        int num = int.parse(stdin.readLineSync()!);
        n1.addNumbers(num);
        break;

      case 2:
        n1.checkNumDivideBy3or5();
        break;
    }
  }while(n != 3);
}