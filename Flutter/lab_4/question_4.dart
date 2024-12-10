// WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.

import 'dart:io';

void main(){
  print("Enter a number to check prime number : ");
  int n = int.parse(stdin.readLineSync()!);

  if(check(n) != 1){
    print("Number is not prime nubmer.");
  }
  else{
    print("Number is prime number.");
  }
}

int check(int n){
  int count = 0;
  for(int i = 2 ; i < n/2 ; i++) {
    if (n % i == 0) {
      count++;
    };
  }
  if(count != 0 ){
   return 0;
  }
  else{
    return 1;
  }
}