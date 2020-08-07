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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(child: Image(image: AssetImage('img/j_platform.png'),),),
          Card(
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text('Welcome to J-NOT',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white),),
            ),
            elevation: 5,
          ),
          Card(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: Column(children: <Widget>[
                  TextField(decoration: InputDecoration(
                    labelText: 'USERNAME',
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
                labelStyle: Theme.of(context).textTheme.title,
              ),
              ),
          ],
          ),
            ),),
          Card(
            child: Container(
              child: Column(children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.deepPurple,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child:Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ],
              ),
            ),
          )
        ],
      ),
    );
  }


}