import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'logicalref.dart';



Future<listlogref> fetchref(String token,String username) async{
  String Abtoken="1:" + token + ":" + username;
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String productEncoded = stringToBase64.encode(Abtoken);
  print("authkey : "+ productEncoded);
  final response= await http.post(
    'http://172.16.1.97:8090/logo/restservices/rest/dataQuery/executeSelectQuery',
    headers:{'content-type': 'application/json; charset=UTF-8',
      'Auth-Token': productEncoded},
    body: jsonEncode({
      "jsonFormat": 1,
      "querySqlText":"SELECT LOGICALREF FROM S_USERS WHERE USERNAME = username",
      "maxCount":-1
    }
    ),
  );
  final responseJson = json.decode(response.body)['rows'];
  return new listlogref.fromJson(responseJson);
}

Future<Product> fetchProduct(authToken,userName) async {
  authToken = "1:" + authToken + ":" + userName;
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String productEncoded = stringToBase64.encode(authToken);
  print("authkey : "+ productEncoded);
  final response = await http.post(
    'http://172.16.1.97:8090/logo/restservices/rest/dataQuery/executeSelectQuery',
    headers: {'content-type': 'application/json; charset=UTF-8',
      'Auth-Token': productEncoded},
    body: jsonEncode({
      "jsonFormat":1,
      "querySqlText":"SELECT LOGICALREF,CODE,DESCRIPTION FROM u_001_ITEMS",
      "maxCount":-1,
    }),
  );
  final responseJson = json.decode(response.body)['rows'];
  print(Product.fromJson(responseJson).rows);
  return Product.fromJson(responseJson);
}


class Product {
  final List<rowsList> rows;
  Product({
    this.rows,
  });
  factory Product.fromJson(List<dynamic> parsedJson) {
    List<rowsList> rows = new List<rowsList>();
    rows = parsedJson.map((i)=>rowsList.fromJson(i)).toList();
    return new Product(
      rows: rows,
    );
  }
}
class rowsList{
  String code;
  String description;
  rowsList({this.code,this.description});
  factory rowsList.fromJson(Map<String, dynamic> json) {
    return new rowsList(
      code: json['CODE'],
      description: json['DESCRIPTION'],
    );
  }
}
