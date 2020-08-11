import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev/models/drawer_menu.dart';


class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      /*Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 30,) ,
              child: Column(
                children: <Widget>[
                  Text('USER',style: TextStyle(fontSize: 22,color: Colors.red),),
                  Text('ERAY GÖNÜLAL',style: TextStyle(fontSize: 22,color: Colors.red),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,) ,
            child:Text('Settings',style: TextStyle(fontSize: 22,color: Colors.red,fontWeight: FontWeight.bold),),
            ),

            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.red,
                  size: 22,
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                  child:
                    FlatButton(
                      child: Text(
                        'LOG-OUT',
                        style: TextStyle(color: Colors.white,fontSize: 22),textAlign: TextAlign.center,),
                      color: Colors.red,
                      onPressed: () {print('eray mal');},
                    ),
                ),
              ],
            ),
          ],
        ),
      ),*/
      appBar: AppBar(
        title: Text(
        'Request on board',
        ),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child:Text('ilk notification'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: (){
                print('kaydedildi');
              },
              child: const Text('viewed',style: TextStyle(color: Colors.white,fontSize: 25),),
              color: Colors.red,

            ),
          ),
        ],
      )
    );
  }
}
