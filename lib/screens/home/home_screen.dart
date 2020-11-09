import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/home/components/body.dart';
import 'package:liztag/screens/home/components/main_drawer.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(_scaffoldKey),
        body: Body(),
        drawer: MainDrawer(),
      ),
    );
  }



  AppBar buildAppBar(GlobalKey<ScaffoldState> globalKey) {
    return AppBar(
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.menu, color: kPrimaryLightColor,),onPressed: (){globalKey..currentState.openDrawer();},),
      backgroundColor: kPrimaryColor,
    );
  }
}


