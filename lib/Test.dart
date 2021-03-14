import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const ORDER_DETAIL_DD = 222200000;
const awe222 = 2323 * 23;

void main() {
  print("测试入口");

  const TAG = "TEST";

  int num1; // 未初始化的变量默认值是 null，Dart 中一切都是对象

  dynamic obj = 0;
  obj = "2"; // 可以更改数据类型
  // print("$TAG: $obj");

  var bl1;
  bl1 = 1;
  bl1 = "字符串";
  // print("$TAG: ${bl1}");

  num bl2 = 0;
  bl2 = 2.3;
  int bl3 = 0;
  // bl3 = 2.3; // 错误

  var bl4 = 2;
  // assert(bl4 > 1); // 正常执行
  // MyAssert("2"); // 报错，有错误提示

  const awe222 = 2323 * 23;
  const bianli = const [4, 2, 2];
  // bianli[1] = 1; // 错误：Cannot modify an unmodifiable list
  // print("$TAG: ${bianli[1]}");

  // List
  var intlist = [1, 2, 5, 6, 3];
  intlist.sort((a, b) => a.compareTo(b));
  // print("$TAG: $intlist");

  // Map
  var map1 = {'fisrt': 'dart', 'second': 'java'};
  // map1.forEach((key, value) => print("key:${key}, value:${value}"));

  var map2 = <String, String>{
    "key": "value",
    "key2": "value2",
  };

  String str = '单引号中的"双引号"' "222"
      "999";
  String str1 = "双引号中的'单引号'";
  String str2 = '单引号中的\'单引号\'';
  String str3 = "双引号中的\"双引号\"";
  // print("$TAG: $str");
  // print("$TAG: $str1");
  // print("$TAG: $str2");
  // print("$TAG: $str3");

  var book = Book2(10);
  var book2 = Book2(20);
  // print("$TAG: ${book > book2}");
  // print("$TAG: ${book[20]}");

  var s = sum();
  s();
  s();

  method2((var name) {
    // print("OrderDetailTest: $name");
    return "55";
  });

  Map<String, MyTypedef> specialMap = {
    "my key" : (ty, ty2) { return (ty + ty2); },
  };
  specialMap?.forEach((key, value) {
    // print("$TAG: $key, ${value(1, 3)} ---");
  });

  var myTypedef = (ty, ty2) { return (ty + ty2); };
  // print("$TAG: ${myTypedef(1, 30)}");

  MyTypedefClass mm = MyTypedefClass((ty, ty2) { return (ty + ty2); });
  MyTypedefClass mm2 = MyTypedefClass((ty, ty2) { return (ty + ty2); });
  // print("$TAG: ${mm.mapValue(100, 2)}");

  String ccc;
  String ccc2;
  var sss = ccc ?? "333";
  var sss2 = ccc2 ??= "3335";
  // print("$TAG: 长度：${ccc?.length},  $sss, $sss2");

  var e = MyExternalChild();
  // print("$TAG: ${e.myExternal()}");

}

class MyExternal {
  external String myExternal();
}
class MyExternalChild extends MyExternal {
  @override
  String myExternal() {
    return "my external";
  }
}

typedef MyTypedef = int Function(int ty, int ty2);

class MyTypedefClass {
  MyTypedef mapValue;
  MyTypedefClass(this.mapValue);
}

class MyAssert {
  var a;
  MyAssert(this.a): assert(a == "1");
}

class MyCons {
  final h ;
  const MyCons(this.h);
}

class MyWidth {
  var width = 1, height  = 2;
  get area => width * height;
  set area(value) => width = value;
}

void method2(String click(var name)) => click("met");

// 闭包
sum() {
  var num = 0;
  // sum2(){
  //   num++;
  //   print(num);
  // }
  // return sum2;

  // 也可以这么写，匿名的方式用的最多
  return () {
    num++;
    // print("OrderDetailTest: num: $num");
  };
}

class Book {
  var name, age;

  final sex;
  Book(this.name, this.age, var sex, {var a1, var a2}) : this.sex = sex;
  // Book(this.name, this.age, this.sex);

  void ssss() {
    var b = Book(1, 1, 1, a1: 3);
  }
}


/*
abstract class Animal {
  var name, age, sex;
  Animal(this.name);
  Animal.withAge(this.age);
  Animal.withSex(this.age);
}

class Dog extends Animal{
  Dog(name) : super(name);
  Dog.withAge(age): super.withAge(age);
}

class Cat extends Animal{
  final sex;
  Cat(name, this.sex) : super(name);
  Cat.withSex(age, this.sex): super.withSex(age);
}

class MyAnimal extends Animal{
  MyAnimal(name) : super(name);
}
*/

// abstract 接口1
/*
abstract class Animal1{
  void speak();
  void speak2();
  talk() {
    print("Animal1-talk");
  }
  run() {
    print("Animal1-run");
  }
}
abstract class Animal2{
  void speak3();
}
class Dog1 implements Animal1, Animal2  {
  @override
  void speak() {}

  @override
  void speak2() {}

  @override
  void speak3() {}

  @override
  run() {
    print("run");
  }

  @override
  talk() {
    throw UnimplementedError();
  }
}
*/

// mixin 接口2
/*
mixin Animal1{
  void speak();
  void speak2();
  talk() {
    print("Animal1-talk");
  }
  run() {
    print("Animal1-run");
  }
}
abstract class Animal2{
  void speak3();
}
class Dog1 with Animal1, Animal2  {
  @override
  void speak() {}

  @override
  void speak2() {}

  @override
  void speak3() {}

  @override
  run() {
    print("run");
  }
}
*/

class Book2 {
  var price;
  var _name = "book-20";
  Book2(this.price);
  operator > (Book2 otherBook) {
    return this.price > otherBook.price;
  }
  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return this.price == other;
  }
  operator [](int realPrice) {
    switch(realPrice) {
      case 10: return price;return;
      case 20: return _name;return;
    }
  }
}



