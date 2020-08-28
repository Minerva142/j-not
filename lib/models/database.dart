//bu kısım daha tamamlanmadı 

import 'dart:async';

import 'package:odev/models/username.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*class usernot{
  final String username;
  final String date;
  final int okundumu;

  usernot({this.username, this.date, this.okundumu});

  Map<String,dynamic> toMap(){
    return {
        'username': username,
        'date': date,
        'okundumu': okundumu,
    };
  }

}

Future<Database> dbhazirla() async{
  final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'okundu.db'),
      onCreate: (db,version){
        return db.execute(
          "CREATE TABLE users(username STRING,date STRING, okundumu INTEGER)"
        );
      },
    version: 1,
  );
  return database;
}

Future<void> insertuser(Future<Database> database,usernot ekle) async{
  final Database db= await database;
  await db.insert(
    'users',
    ekle.toMap(),
  );
}

Future<List<usernot>> retrieve(Future<Database> database){
      final Database db = await database;
      final List<Map<String,dynamic>> maps =  await db.query('users');
      return List.generate(maps.length, (i) => {
          return usernot(
          id: maps[i]['username'];
          date: maps[i]['date'];
      );
      }
      );
}*/