import 'dart:io';

void main(){

  List<int> list = [4, 1, 2, 1, 2];
  Map<int , int> map = {};

  for(int n in list){
    if(map.containsKey(n)){
      map.update(n, (value) => value + 1);
    }
    else{
      map[n] = 1;
    }
  }

  map.forEach((key,value){
    if(value == 1){
      print(key);
    }
  });

}