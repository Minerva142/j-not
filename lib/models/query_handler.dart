import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:odev/models/username.dart';
import 'package:http/http.dart' as http;

/*Future<List<Product>> fetchProduct(authToken,userName) async {
  authToken = "1:" + authToken + ":" + userName;
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String productEncoded = stringToBase64.encode(authToken);

  final response = await http.post(
    'http://172.16.1.97:8090/logo/restservices/rest/dataQuery/executeSelectQuery',
    headers: {'content-type': 'application/json; charset=UTF-8',
      'Auth-Token': productEncoded},
    body: jsonEncode({
      "jsonFormat":1,
      "querySqlText":"SELECT LOGICALREF,CODE,DESCRIPTION FROM u_001_ITEMS",//sql sorgusu
      "maxCount":-1,
    }),
  );
  var list = json.decode(response.body)['rows'];
  print(list.runtimeType);
  print(list);
  return list;
  }
*/
