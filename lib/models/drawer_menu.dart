
import 'package:flutter/material.dart';


class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Align(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                image: AssetImage('img/j_platform.png'),
                ),
                Text(
                "USER",
                style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                Text(
                "Eray Gönülal",
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                ),
              ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.red,),
            title: Text('LOG-OUT',style: TextStyle(color: Colors.red,fontSize: 25),),
            trailing: Icon(Icons.arrow_right,color: Colors.red,),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
              //Navigator.of(context).popUntil((route) => route.isFirst);
              //Navigator.popUntil(context, ModalRoute.withName(''));
              //Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()));
            },
          ),
        ],
      ),
    );
  }
}
