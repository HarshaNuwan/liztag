import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:liztag/constants.dart';
import 'package:liztag/entities/user_entity.dart';


class SignUpApiProvider {


  static Future<bool> signUp(UserEntity userEntity) async {
    var body = jsonEncode({"phoneNumber":"${userEntity.phoneNumber}", "encryptedPassword":"${userEntity.phoneNumber}", "name" :"${userEntity.name}",
    "email":"${userEntity.email}", "enabled":"true"});

    print("Body: " + body);
    bool status;
   await http.post(LIZTAG_API_URL + "user/signup",
        headers: {"Content-Type": "application/json"},
        body: body
    ).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
      print(response.body);

      if(response.body == "Success"){
        status = true;
      }else{
        status = false;
      }
    });

    return status;
  }

}