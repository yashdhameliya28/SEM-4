// WAP that prompts the user to enter 5 numbers, stores them in a List, and displays them in
// increasing order.
import 'dart:io';

class AddNumber{
  List<dynamic> li = [];

  void addNum(int n){
    li.add(n);
  }

  void printList(){
    for(dynamic i in li){
      print(i);
    }
  }

}

void  main(){
  AddNumber an = AddNumber();
  for(int i = 1 ; i <= 5 ; i++){
    stdout.write("Enter ${i} element : ");
    an.addNum(int.parse(stdin.readLineSync()!));
  }

  an.printList();
}