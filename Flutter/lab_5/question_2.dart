// WAP to read 2 list and return list that contains only the elements that are common between
// them.

import 'dart:io';

class CompareList{
  void compareList(List l1, List l2 , List finalList) {
    for(int i = 0 ; i < l1.length ; i++){
      int temp = l1[i];
      for(int j = 0 ; j < l2.length ; j++){
        if(temp == l2[j]){
          finalList.add(temp);
        }
      }
    }
  }

  void printList(List finalList){
    for(int i in finalList){
      print(i);
    }
  }
}

void main(){
  print("Enter both list length : ");
  int length = int.parse(stdin.readLineSync()!);

  List<int> l1 = List.filled(length, 0);
  List<int> l2 = List.filled(length, 0);
  List<int> finalList = [];

  CompareList cl = CompareList();

  for(int i = 0 ; i < length ; i++){
    stdout.write("Enter ${i + 1} element : ");
    l1[i] = (int.parse(stdin.readLineSync()!));
  }
  print("-----------------------------");

  for(int i = 0 ; i < length ; i++){
    stdout.write("Enter ${i + 1} element : ");
    l2[i] = (int.parse(stdin.readLineSync()!));
  }

  cl.compareList(l1, l2, finalList);
  cl.printList(finalList);
}