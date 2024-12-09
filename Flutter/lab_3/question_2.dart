import 'dart:io';

void main(){
  print("Enter a number : ");
  int n = int.parse(stdin.readLineSync()!);
  int ans = 1;
  for(int i = 1 ; i <= n ; i++){
    ans *= i;
  }

  print(ans);
}