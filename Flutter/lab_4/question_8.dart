// WAP to find the intersection of two integer arrays, nums1 and nums2. Each element in the
// result should appear as many times as it appears in both arrays, and the result should be
// returned in sorted order. Example: Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2], Output: [2, 2];
// Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4], Output: [4, 9].

import 'dart:io';
void main(){
  List<int> str1 = [];
  List<int> str2 = [];
  List<int> str3 = [];

  print("Enter first array lenght : ");
  int n1 = int.parse(stdin.readLineSync()!);
  print(string1(str1,n1));
  print("Enter secound array lenght : ");
  int n2 = int.parse(stdin.readLineSync()!);
  print(string2(str2,n2));
  smilar(str1, str2, str3);
}
List string1(List list , int n1){
  for(int i = 0 ; i < n1 ; i++){
    print("Enter ${i + 1} element value : ");
    int value = int.parse(stdin.readLineSync()!);

    list.add(value);
  }
  return list;
}
List string2(List list , int n2){
  for(int i = 0 ; i < n2 ; i++){
    print("Enter ${i + 1} element value : ");
    int value = int.parse(stdin.readLineSync()!);

    list.add(value);
  }
  return list;
}
void smilar(List str1,List str2,List str3){
  for(int i =0;i<str1.length;i++){
    for(int j= 0;j<str2.length;j++){
      if(str1[i]==str2[j]){
        str3.add(str1[i]);
      }
    }
  }
  print('similar number is $str3');

}