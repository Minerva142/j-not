import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:odev/models/notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';


class ayrinti extends StatefulWidget {
  Nots denem;
  ayrinti(this.denem);
  @override
  _ayrintiState createState() => _ayrintiState(denem);
}

class _ayrintiState extends State<ayrinti> {
  Nots denem;
  _ayrintiState(this.denem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(denem.subject,),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: ListTile.divideTiles(
            color: Colors.red,
          context: context,
          tiles: [
            ListTile(
              title: Text('Tür',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
              subtitle: Text(not_tp(denem.not_type),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
              ),
            ListTile(
              title: Text('Önem',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
              subtitle: Text(Priority_solver(denem.priority),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
              ),
            ListTile(
              title: Text('Statü',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
              subtitle: Text(statu_handler(denem.bosstatus),style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
            ),
            ListTile(
              title: Text('Actual Date',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
              subtitle: Text(denem.actualdate,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20))),
            ),
            ListTile(
              title: Text('Message Content',style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold))),
              subtitle:Html(
                data:stringduzenle(denem.message_content),
                style: {
                  "body": Style(
                      color: Colors.black38,
                      fontSize: FontSize(20),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                  ),
                },
            ),
            ),
          ],
        ).toList(),
        )
      ),
    );
  }
  String statu_handler(int i){
    if(i==1){
      return 'Okundu';
    }
    else{
      return 'Okunmadı';
    }
  }

  String not_tp(int i){
    if(i==0){
      return 'Bildirim';
    }
    else{
      return 'Onay';
    }
  }

  String Priority_solver(int i){
    if(i==0){
      return 'Düşük';
    }
    else if(i==1){
      return 'Normal';
    }
    else{
      return 'Yüksek';
    }
  }

  String stringduzenle(String content){
    //print(content);
    String tmp=content;
    String tmp2= tmp.replaceAll('\n', '');
    print(tmp2);
    String decoded = utf8.decode(base64.decode(tmp2));
    return decoded;
  }
}
