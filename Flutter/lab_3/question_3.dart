import 'dart:io';

void main(){
  print("Enter a number : ");
  int n = int.parse(stdin.readLineSync()!);
  int count = 0;
  for(int i = 2 ; i < n/2 ; i++){
    if(n % i == 0){
      count++;
    }
  }
  
  if(count != 0 ){
    print("Given number is not prime number.");
  }
  else{
    print("Given number is prime number.");
  }
}