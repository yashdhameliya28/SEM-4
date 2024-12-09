import 'dart:io';
void main(){


  Map<int,int> mp  = {};
  print(mp);

  List list = [2, 2, 1, 1, 1, 2, 2,3];
  int n = list.length;

  for(int n in list){
    if(mp.containsKey(n)){
      // mp[n] = mp[n] + 1;
      mp.update(n, (value)=> value+1);
    }else{
      mp[n] = 1;
    }
  }


  mp.forEach((key,value){
    if(value > (n/2)){
      print(key);
    }
  });

}