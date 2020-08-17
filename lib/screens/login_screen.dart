import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:odev/models/username.dart';

import 'notification.dart';
import 'package:flutter/material.dart';
import 'package:odev/models/auth_handler.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}





class _LoginState extends State<Login> {
  List<Text> hatalar=[
    Text('Please Enter Your Username and Password',style: TextStyle(fontSize: 15,color: Colors.black87),),
    Text('Wrong Password or Username !!!',style: TextStyle(fontSize: 20,color: Colors.red),),
  ];
  int _cntr=0;

  void _incrctr(){
    setState(() {
      _cntr=1;
    });
  }
  void _decctr(){
    setState(() {
      _cntr=0;
    });
  }

  int yeni_sayi(){
    int min = 0;
    int max = 4;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    return r;
  }
  bool trigger=false;
  final username= TextEditingController();
  final password= TextEditingController();

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
        appBar: AppBar(automaticallyImplyLeading:false,title: Text('Logo J-NOT',),),
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
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(150, 10, 155, 1).withOpacity(0.5),
                      Color.fromRGBO(255, 0, 0, 1).withOpacity(0.9),
                  ],
                  ),
                ),
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text('Welcome to J-NOT',textAlign: TextAlign.center,style: GoogleFonts.lato(fontSize: 27,color: Colors.white),),
              ),
            Container(
                  margin: EdgeInsets.symmetric(vertical: 5,) ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),//BorderRadius.all(Radius.circular(10.0)),color: Colors.white ),
                  child: TextFormField(
                    controller: username,
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    decoration: InputDecoration(
                      icon: Icon(Icons.supervised_user_circle,color: Colors.red,),
                      fillColor: Colors.deepPurple,
                      hintText: 'x@x.com',
                      helperText: 'write your username.',
                      labelText: 'USERNAME',
                      hasFloatingPlaceholder: false,
                      //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      labelStyle: Theme.of(context).textTheme.title,
                  ),
                    keyboardType: TextInputType.emailAddress,
                  ),
            ),
            Container(
                //padding: EdgeInsets.symmetric(vertical: 25.0),
                margin: EdgeInsets.symmetric(vertical: 5,) ,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)), //BorderRadius.all(Radius.circular(10.0)),color: Colors.white,),
                child:
                  TextFormField(
                    obscureText: true,
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    controller: password,
                    decoration: InputDecoration(
                      helperText: "Write your password.",
                      labelText: 'PASSWORD',
                      hasFloatingPlaceholder: false,
                    icon: Icon(Icons.lock,color: Colors.red,),
                    labelStyle: Theme.of(context).textTheme.title,
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.red,
                      ),
                  ),
                  ),
              ),
            Container(
              alignment: Alignment.center,
              child: hatalar[_cntr],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: () => {
                      _incrctr(),
                      authenticate(username.text,password.text).then((value) =>{
                        //print(value.authorization), TEST
                        if(value.success){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  Notifications(value.authorization))),
                          username.clear(),
                          password.clear(),
                          _decctr(),
                        }
                      }
                      ),
                      //print(username.text), TEST
                      //print(password.text), TEST
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
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
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
