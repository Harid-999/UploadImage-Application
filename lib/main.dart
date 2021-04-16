import 'package:flutter/material.dart';
import 'package:termproject/Drawer.dart';
import 'package:termproject/Login.dart';
import 'package:termproject/HomePage.dart';
import 'package:termproject/Upload.dart';
import 'package:termproject/About.dart';

import 'Gallery.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

String name = '', lastname = '', code = '', department = '';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Login(),
      builder: EasyLoading.init(),
      routes: <String, WidgetBuilder>{
          '/Login' : (BuildContext context) => new Login(),
          '/HomePage' : (BuildContext context) => new HomePage(name: name, lastname: lastname, code: code, department: department),
          '/MyDrawer' : (BuildContext context) => new MyDrawer(name: name, lastname: lastname, code: code),
          '/Upload' : (BuildContext context) => new Upload(name: name, lastname: lastname, code: code),
          '/Gallery' : (BuildContext context) => new Gallery(name: name, lastname: lastname, code: code),
          '/Abount': (BuildContext context) => new Abount(name: name, lastname: lastname, code: code),
      },
    );
  }
}

void configLoading(){
  EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  ..loadingStyle = EasyLoadingStyle.dark
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = Colors.green
  ..indicatorColor = Colors.yellow
  ..textColor = Colors.yellow
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}
