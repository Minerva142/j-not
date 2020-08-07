import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        canvasColor: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  static int min = 0;
  static int max = 4;
  static Random rnd = Random();
  int r = min + rnd.nextInt(max - min);
  List<String> images=[
       'img/indir.png',
       'img/indir.jpg' ,
       'img/logo_bs.jpg' ,
       'img/0.jpg' ,
       'images.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
          alignment: Alignment.center,
          child: Image(
          image: AssetImage('img/j_platform.png'),
          ),
         ),
          Card(
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text('Welcome to J-NOT',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold, ),),
            ),
            elevation: 5,
          ),
          Card(
            elevation: 10,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                  TextField(decoration: InputDecoration(
                    labelText: 'USERNAME',
                    border: OutlineInputBorder(),
                    labelStyle: Theme.of(context).textTheme.title,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
              TextField(decoration: InputDecoration(
                labelText: 'PASSWORD',
                  border: OutlineInputBorder(),
                labelStyle: Theme.of(context).textTheme.title,
              ),
              ),
          ],
          ),
            ),
          ),
          Card(
            child: Container(
              height: 50,
              padding: EdgeInsets.all(0),
              child:
                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.deepPurple,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child:Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(),
            alignment: Alignment.bottomCenter,
            child: Image(image: AssetImage(images[r]),width: double.infinity,),
          )
        ],
      ),
    )
    );
  }


}