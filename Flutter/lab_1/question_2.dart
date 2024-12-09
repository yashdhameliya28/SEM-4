// C = (°F - 32) × 5/9
import 'dart:io';

void main(){
  print("Enter Fahreheit value : ");
  int f = int.parse(stdin.readLineSync()!);
  print("Celsius : ${(f-32)*5/9}");
}