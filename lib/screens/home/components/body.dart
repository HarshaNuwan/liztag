import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/home/components/categories.dart';
import 'package:liztag/screens/home/components/header_with_search_box.dart';
import 'package:liztag/screens/home/components/hot_deals.dart';
import 'package:liztag/screens/home/components/title_with_more_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(),
          TitleWithMoreButton(title: "Hot Deals", press: (){},),
          HotDeals(),
          TitleWithMoreButton(title: "Categories", press: (){},),
          Categories()
        ],
      ),
    );
  }
}










