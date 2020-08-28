import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odev/models/drawer_menu.dart';
import 'package:odev/models/notifications.dart';
import 'package:odev/models/notifications_handler.dart';
import 'package:odev/models/query_handler.dart';
import 'package:odev/models/logicalref.dart';
import 'package:path_provider/path_provider.dart';


import 'ayrintibilgi.dart';


class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/okundu.txt');
  }

  Future<String> readveri() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return 'olmadı';
    }
  }

  bool controller(String aranan, String genel){
    return genel.contains(aranan);
  }

  int indexbul(String aranan,String genel){
    return genel.indexOf(aranan+':')+ (aranan.length+1);
  }
  String arraytostr(List<bool> liste){
    String yeni;
    List<int> storage=new List<int>(liste.length);
    for(int i=0;i<liste.length;i++){
      if(liste[i]==true){
        storage[i]=1;
      }
      else{
        storage[i]=0;
      }
    }
    for(int j=0;j<storage.length;j++){
      yeni=yeni+storage[j].toString();
    }
    return yeni;
  }

  Future<File> writeCounter(String okundu) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(okundu);
  }
}

class Notifications extends StatefulWidget {
  final storage;
  final String username;
  Notifications(this.storage,this.username);
  @override
  _notificationState createState() => _notificationState(storage,username);
}



  class _notificationState extends State<Notifications> {
    //String sa='asbas';
    CounterStorage okundumu=new CounterStorage();
    _notificationState(this.storage,this.username);
    listlogref bakalim= listlogref();
    List<Nots> denem=new List<Nots>();
    List<Widget> yer=new List<Widget>();
    final storage;
    final  String username;
    int logref;
    List<bool> okundu=new List<bool>();

    @override
    void initState() {
      localstr();
      firsttime();
      getrefsfromapi();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: Mydrawer(this.username.toUpperCase()),
        appBar: AppBar(
          title: Text(
          'Request on board',
          ),
        ),
        body:ListView(
            children: <Widget>[
            FutureBuilder<listofnot>(
              future: fetchnots(storage, username, 1),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done)
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: widgetgir(),
                    ),
                  );
                else
                  return CircularProgressIndicator();
              },
            ),
            ],
          ),
        )
      );
  }


  void getrefsfromapi() {
      Timer.periodic(Duration(seconds: 30), (Timer t) {
        fetchref(storage, username).then((value) =>
        {
          logref = value.refs[0].ref,
          fetchnots(storage, username, logref).then((value) =>
          {
            setState(() {
              this.denem = value.bildirim;
              widgetgir();
            }),
          })
        }
        );
      });
  }

  List<Widget> widgetgir() {
      yer.clear();
      //print(okundu.length);
      for(int i=0;i<denem.length;i++){
        //print(denem[i].subject);
        if(okundu[i]==false) {
          yer.add(widgetlariekle(denem[i], i));
        }
      }
      return yer;
  }

  Widget widgetlariekle(Nots denem,int i) {
      return Container(
        margin: EdgeInsets.all(10),
        child: FlatButton(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.red,
            onPressed: () {
              okundu[i]=true;
              firsttime();
              Navigator.push(context,MaterialPageRoute(builder: (context) => ayrinti(denem)));
            },
            child: Column(
                children: <Widget>[
                  Text(denem.subject,style: TextStyle(fontSize: 20,color: Colors.white),),
                  Text('Tür : '+not_tp(denem.not_type) , style: TextStyle(fontSize: 12,color: Colors.white),),
                  Text('Önem : '+Priority_solver(denem.priority) , style: TextStyle(fontSize: 12,color: Colors.white),),
                  Text('Statü : '+statu_handler(denem.bosstatus) , style: TextStyle(fontSize: 12,color: Colors.white),)
                ],
              ),
      )
      );
  }

  String statu_handler(int i){
      if(i==1){
        return 'okundu';
      }
      else{
        return 'okunmadı';
      }
  }

  String not_tp(int i){
      if(i==0){
        return 'Bildirim';
      }
      else{
        return 'onay';
      }
  }

  String Priority_solver(int i){
      if(i==0){
        return 'düşük';
      }
      else if(i==1){
        return 'normal';
      }
      else{
        return 'yüksek';
      }
  }

  void firsttime() {
    fetchref(storage, username).then((value) =>
    {
      logref = value.refs[0].ref,
      fetchnots(storage, username, logref).then((value) =>
      {
        setState(() {
          this.denem = value.bildirim;
          widgetgir();
        }),
      })
    }
    );
  }

  void localstr() {
    fetchref(storage, username).then((value) =>
    {
      logref = value.refs[0].ref,
      fetchnots(storage, username, logref).then((value) =>
      {
        setState(() {
          this.denem = value.bildirim;
          okundu.length=denem.length;
          for(int i=0;i<denem.length;i++){
            okundu[i]=false;
          }
        }),
      })
    }
    );
  }


}





