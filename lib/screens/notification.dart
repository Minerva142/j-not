import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev/models/drawer_menu.dart';


class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool isSwitched;
  List<bool> isSelected=[false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
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
                ListTile(
                  title: Text('ilk notification'),
                  subtitle: Text('Status'),
                  trailing: ToggleButtons(
                    borderWidth: 2,
                    borderColor: Colors.red,
                    fillColor: Colors.red,
                    color: Colors.red,
                    children: <Widget>[
                      Icon(Icons.cancel,color: Colors.black,size: 35,),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    isSelected: isSelected,
                  ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              elevation: 5,
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
