import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'notifications.dart';

Future<listofnot> fetchnots(String token,String username,int logref) async{
  String Abtoken="1:" + token + ":" + username;
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String productEncoded = stringToBase64.encode(Abtoken);
  final response= await http.post(
    'http://172.16.1.97:8090/logo/restservices/rest/dataQuery/executeSelectQuery',
    headers:{'content-type': 'application/json; charset=UTF-8',
      'Auth-Token': productEncoded},
    body: jsonEncode({
      "jsonFormat":1,
      "querySqlText":"SELECT LOGICALREF, NOTIFICATIONTYPE, BOSTATUS, PRIORITY, ACTUALDATE, MESSAGESUBJECT, MESSAGECONTENT FROM U_001_01_NOTIFYTRANS WHERE (USERREF = "+ logref.toString() +") ORDER BY ACTUALDATE DESC ",
      "maxCount":-1
    }
    ),
  );
  final responseJson = json.decode(utf8.decode(response.bodyBytes))['rows'];
  return listofnot.fromJson(responseJson);
}