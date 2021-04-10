import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/RouterTest.dart';
import 'package:flutter_boost/flutter_boost_app.dart';

// 应用入口
void main() => runApp(MyApp());

// 应用本身等大多数东西都是一个widget（称“组件”或“部件”）
// widget 包括对齐(alignment)、填充(padding)和布局(layout)等。
class MyApp extends StatelessWidget {
  // Flutter在构建页面（组合、拼装其它基础widget）时，会调用组件的build方法
  @override
  Widget build(BuildContext context) {
    // MaterialApp 是Material库中提供的Flutter APP框架，
    // 通过它可以设置应用的名称、主题、语言、首页及路由列表等。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home 是应用首页路由
      routes: {
        "new_test": (context) => OrderDetailTest(),
        "new_route": (context) {
          return RouterTest(text: ModalRoute.of(context).settings.arguments);
          },
        // 将其名字作为MaterialApp的initialRoute属性值即可，
        // 该属性决定应用的初始路由页是哪一个命名路由。
        "/": (context) => MyHomePage(title: "Flutter Demo Home Page111")
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，
// 而Stateless widget是不可变的。
class MyHomePage extends StatefulWidget {
  // Stateful widget至少由两个类组成：一个StatefulWidget类；一个 State类。
  // State类中持有的状态在widget生命周期中可能会发生变化。
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const CHANNEL_NAME = "com.alex.practice/flutter";
  static const platformMethodChannel = const MethodChannel(CHANNEL_NAME);
  static const platformMsgChannel = BasicMessageChannel<String>(CHANNEL_NAME, StringCodec());

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 先自增_counter，然后调用setState()通知更新框架，
      // 调用build()根据新状态重新构建页面
      _counter++;
    });
  }

  // 调用Widget的build方法来构建widget树，最终渲染到设备屏幕上。
  @override
  Widget build(BuildContext context) {
    // 提供页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。
    // 路由默认都是通过Scaffold创建。
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            FlatButton(
              child: Text("跳转到其他页面"),
              textColor: Colors.blue,
              onPressed: () {
                // debugDumpApp();
                Navigator.of(context).pushNamed("new_route", arguments: "8885588");
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RouterTest(text: "222");
                // }));
              },
            ),
            FlatButton(
              child: Text("跳转到其他页面，接收参数"),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RouterTest(text: "参数。。");
                }));
                print("路由返回值11: $result");
              },
            ),
            FlatButton(
              child: Text("跳转到其他页面3"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("new_test", arguments: "1");
              },
            ),
            FlatButton(
              child: Text("获取平台传递的信息"),
              textColor: Colors.blue,
              onPressed: _getPlatformInfo,
              // onPressed: _getAndroidInfo,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  // 通过 MethodChannel 的 invokeMethod() 来与原生交互信息
  Future<void> _getPlatformInfo() async{
    String androidInfo;
    try {
      // 第二个参数是回传给 Android 端数据
      androidInfo = await platformMethodChannel.invokeMethod("my_android_flutter_msg", "Flutter Page");
      print("alexxx 从平台获取的值：" + androidInfo);
    } catch(e){
      androidInfo = "nothing";
      print("alexxx 未从平台获取到值: ${e.message}");
    }
  }
  // 通过 BasicMessageChannel 的 send() 来与原生交互信息
  _getAndroidInfo() async {
    String reply = await platformMsgChannel.send("flutter msg---");
    print("alexxx 来自 Android 平台信息：" + reply);
  }
}

class OrderDetailTest extends StatelessWidget {
  final String text;
  OrderDetailTest({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("路由标题"),
      ),
      body: Center(
          child: Column(children: <Widget>[
            Text(args),
            RaisedButton(
              onPressed: () => Navigator.pop(context, "返回值"),
              child: Text("返回键"),
            )
          ])),
    );
  }
}