import 'dart:io';

import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/home/home_screen.dart';
import 'package:liztag/screens/signup/signup_screen.dart';
import 'package:liztag/screens/welcome/components/background.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    getData();
  }

  void getData() async{
    await Future.delayed(Duration(seconds:3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("", '+94772372965');
      //prefs.remove(_kUserPhoneNumber);

      String _vuserPhoneNumber = prefs.getString(PHONE_NUMBER) ?? '0';
      if('0' == _vuserPhoneNumber){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUpScreen()) );
      }else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen()) );
      }
      print(_vuserPhoneNumber);
    });
  }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(
                "LIZTAG",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "please wait...",
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
              Spacer(),
              Text(
                "by",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.white),
              ),
              GestureDetector(
                  onTap: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()) );
                  },
                  child: Text("DuoXis",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white))),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      );
    }

}

