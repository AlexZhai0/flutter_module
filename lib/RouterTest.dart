
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由标题"),),
      body: Center(child: Text("这是个路由页面"),),
    );
  }
}
