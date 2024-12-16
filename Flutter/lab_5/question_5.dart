// WAP to find friends detail by their name using dictionary. (Create local dictionary and search
// from it using Map<String,Object?> & Model Class).

import 'dart:io';

class Model {
  Map<String, int> mp = {};

  void addPhoneNumber(String name, int number) {
    mp[name] = number;
  }

  void searchFriend(name){
    for (dynamic element in mp.keys){
      if(element.toString().toLowerCase() == mp.containsKey(name.toString().toLowerCase())){
        // print("${element.name} , ${element.number}");
        // printDetails(name);
        print(element);
      }
    }
  }

  void printDetails(name){
    print('${name}');
  }

}


void main(){
  int choise;
  Model m1 = Model();

  do{
    print("Enter 1 for add name and phone number");
    print("Enter 2 for search friend");
    print("Enter 3 for exit.");
    choise = int.parse(stdin.readLineSync()!);
    switch (choise){
      case 1:
        stdout.write("Enter name : ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter phone number : ");
        int number = int.parse(stdin.readLineSync()!);
        m1.addPhoneNumber(name, number);
        break;

      case 2:
        print("Enter name to search");
        String name = stdin.readLineSync()!;
        m1.searchFriend(name);
        break;

    }

  }
  while(choise != 3);
}