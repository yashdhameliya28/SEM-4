import 'dart:io';

void main(){

  List<String> list = "this is a test this is a".split(" ");
  Map<String , int> map = {};

  for(String n in list){
    if(map.containsKey(n)){
      map.update(n, (value) => value + 1 );
    }
    else{
      map[n] =  1;
    }
  }

  print(map);
}