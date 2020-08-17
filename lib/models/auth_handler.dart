import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:odev/models/username.dart';
import 'package:http/http.dart' as http;


Future<User> authenticate(String usernamectrl, String passwordctrl) async {
  String authorization = usernamectrl + ":" + passwordctrl + ":1:1:TRTR";
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  String authEncoded = "BASIC " + stringToBase64.encode(authorization);
  final response = await http.post(
    'http://172.16.1.97:8090/logo/restservices/rest/login',
    headers: {HttpHeaders.authorizationHeader: authEncoded},
  );
  final responseJson = json.decode(response.body);
  return User.fromJson(responseJson);
}