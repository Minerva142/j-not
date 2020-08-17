
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            brightness: Brightness.light, color: Colors.red),
            brightness:     Brightness.light,
            primarySwatch: Colors.red,
        //colorScheme: ColorScheme(),buraya bak
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