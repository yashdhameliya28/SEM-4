import 'dart:io';

void main(){
  print("Enter a string : ");
  String str = stdin.readLineSync()!;

  List<String> string_part = str.split(' ');

  String last_word = string_part.last;

  print(last_word.length);
}