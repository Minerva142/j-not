import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

import 'notification.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget{

  @override
  _LoginState createState() => _LoginState();
}



class _LoginState extends State<Login> {


  int yeni_sayi(){
    int min = 0;
    int max = 4;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    return r;
  }

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
        appBar: AppBar(title: Text('Logo J-NOT',),),
        body:Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Image(
                image: AssetImage('img/j_platform.png'),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red,
                ),
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text('Welcome to J-NOT',textAlign: TextAlign.center,style: GoogleFonts.lato(fontSize: 27,color: Colors.white),),
              ),
            Container(
                  margin: EdgeInsets.symmetric(vertical: 5,) ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.white ),
                  child: TextFormField(
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple,
                      labelText: 'USERNAME',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      labelStyle: Theme.of(context).textTheme.title,
                  ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty || value.length < 5 ) {
                        return 'Invalid Username';
                      }
                    },
                  ),
            ),
            Container(
                //padding: EdgeInsets.symmetric(vertical: 25.0),
                margin: EdgeInsets.symmetric(vertical: 5,) ,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.white,),
                child:
                  TextFormField(
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelStyle: Theme.of(context).textTheme.title,
                  ),
                  ),
              ),
            AnimatedContainer(
              duration: Duration(),
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => notification()));
                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.red,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(),
              alignment: Alignment.bottomCenter,
              child: Image(image: AssetImage(images[yeni_sayi()]),width: double.infinity,),
            ),
          ],
          ),
        )
    );
  }
}
