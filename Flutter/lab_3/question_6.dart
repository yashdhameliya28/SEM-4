import 'dart:io';
void main(){
  int even = 0;
  int odd = 0;

  int n = 1;
  while(n != 0 ){
    print('enter a number :');
    n = int.parse(stdin.readLineSync()!);
    if(n>0 && n%2==0){
      even+= n;
    }
    else if (n<0 && n%2 != 0){
      odd += n;
    }
  }
  
  print(odd);
  print(even);
}