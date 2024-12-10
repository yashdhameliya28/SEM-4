//WAP to count number of even or odd number from an array of n numbers.

import 'dart:io';

void main(){
  print("Enter array lenght : ");
  int n = int.parse(stdin.readLineSync()!);
  List<int> list = [];
  print(add_element(list , n));
  check_odd_even(list);
}

List add_element(List list , int n){
  for(int i = 0 ; i < n ; i++){
    print("Enter ${i + 1} element value : ");
    int value = int.parse(stdin.readLineSync()!);

    list.add(value);
  }
  return list;
}

void check_odd_even(List list){
  int no_even = 0;
  int no_odd = 0;
  for (int i in list){
    if(i % 2 == 0){
      no_even++;
    }
    else{
      no_odd++;
    }
  }
  print("even number : $no_even");
  print("odd number : $no_odd");
}