import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main(){
  runApp(MyApp());
}
//yorum ile entegrasyomn kontrolü

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            brightness: Brightness.light, color: Colors.red),
            primarySwatch: Colors.red,
            canvasColor: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(Container(child: Login(),));
  }

}