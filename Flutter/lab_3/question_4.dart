import 'dart:io';

void main(){
  print("Enter a number : ");
  int n = int.parse(stdin.readLineSync()!);
  int reverced_n = 0;

  while(n != 0){
    int last = n % 10;
    reverced_n = reverced_n * 10 + last;
    n ~/= 10;
  }

  print("Reverced number : $reverced_n");
}