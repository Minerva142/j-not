import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev/models/drawer_menu.dart';


class Notifications extends StatefulWidget {
  String storage;
  Notifications(this.storage);
  @override
  _notificationState createState() => _notificationState(storage);
}


class Notf {
  String title;
  String subtitle;
  Notf(this.title,this.subtitle);
}

class _notificationState extends State<Notifications> {
  String storage;
  _notificationState(this.storage);
  List<Notf> mapper=[
    Notf('a','b'),
    Notf('c','d'),
    Notf('e','f'),
  ];
  Future<bool> _onBackPressed(){
    return showDialog(
        context: context,
      builder: (context) =>AlertDialog(
        title: Text('Do you really want to logout?'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context,false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context,true),
          ),
        ],
      ),
    );
}
  List<List<bool>> totalsel = [[false],[false],[false]];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: Mydrawer(),
        appBar: AppBar(
          title: Text(
          'Request on board',
          ),
        ),
        body:Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: mapper.length,
                  itemBuilder: (BuildContext context,int index1){
                  {
                    return ListTile(
                      title: Text(mapper[index1].title),
                      subtitle: Text(mapper[index1].subtitle),
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
                            totalsel[index1][index] = !totalsel[index1][index];
                          });
                        },
                        isSelected: totalsel[index1],
                      ),
                    );
                  }
                  }
              )
            ),
            Container(
              child: Text(storage),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                elevation: 5,
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Notifications(storage)));
                  print('kaydedildi');
                  print(mapper[0].title);
                  print(totalsel[0][0]);
                },
                child: const Text('Viewed',style: TextStyle(color: Colors.white,fontSize: 25),),
                color: Colors.red,
              ),
            ),
          ],
        )
      ),
    );
  }
}


