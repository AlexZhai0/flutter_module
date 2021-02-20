
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterTest extends StatelessWidget {
  RouterTest({Key key, this.text}): super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("路由标题"),),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () => Navigator.pop(context, "返回值"),
              child: Text("返回键"),
            )
          ]
        )
      ),
    );
  }
}