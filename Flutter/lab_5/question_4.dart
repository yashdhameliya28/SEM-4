// WAP to create and read phonebook dictionary.

import 'dart:io';

class PhoneDictionary {
  Map<String, int> mp = {};

  void addPhoneNumber(String name, int number) {
   mp[name] = number;
  }

  void printDictionary(){
    print(mp);
  }
}

void main(){
  int choise;
  PhoneDictionary pd = PhoneDictionary();

  do{
    print("Enter 1 for add name and phone number");
    print("Enter 2 for read dictionary");
    print("Enter 3 for exit.");
    choise = int.parse(stdin.readLineSync()!);
    switch (choise){
      case 1:
        stdout.write("Enter name : ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter phone number : ");
        int number = int.parse(stdin.readLineSync()!);
        pd.addPhoneNumber(name, number);
        break;

      case 2:
        pd.printDictionary();
        break;
    }

  }
  while(choise != 3);
}
