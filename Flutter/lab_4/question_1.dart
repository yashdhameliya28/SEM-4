//WAP to calculate simple interest using method.
import 'dart:io';

void main(){
  print("Enter principle value : ");
  int principle = int.parse(stdin.readLineSync()!);

  print("Enter rate of interest value : ");
  double rate_of_interest = double.parse(stdin.readLineSync()!);

  print("Enter time period : ");
  int time = int.parse(stdin.readLineSync()!);

  print(find_interest(principle, rate_of_interest, time));
}

double find_interest(int principle , double rate_of_interest , int time){
  return principle * rate_of_interest * time;
}