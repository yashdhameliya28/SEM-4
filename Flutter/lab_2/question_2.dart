import 'dart:io';

void main(){
  print("What operation do you want : ");
  String operator = stdin.readLineSync()!;

  print("Enter first number : ");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter second number : ");
  int num2 = int.parse(stdin.readLineSync()!);

  // if(operator == '+'){
  //   print(num1 + num2);
  // }
  // else if(operator == '-'){
  //   print(num1 - num2);
  // }
  // else if(operator == '*'){
  //   print(num1 * num2);
  // }
  // else{
  //   print(num1 / num2);
  // }

  switch (operator) {
    case '+':
      print(num1 + num2);
      break;

    case '-':
      print(num1 - num2);
      break;

    case '*':
      print(num1 * num2);
      break;

      case '/':
      print(num1 / num2);
      break;

      default:
        print("Enter valid operator.");
        break;
  }
}