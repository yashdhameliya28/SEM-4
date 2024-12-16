// WAP that creates List with following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and
// “Ahmedabad” Replace “Ahmedabad” with “Surat” in above List.

import 'dart:io';

void main(){
  List<dynamic> li = ['Delhi','Mumbai','Bangalore','Hyderabad','Ahmedabad'];
  print(li);

  String select = 'Ahmedabad';
  String newinpurt = 'Surat';

  var index = li.indexOf(select);
  li.replaceRange(index, index+1, [newinpurt]);
  print(li);
}