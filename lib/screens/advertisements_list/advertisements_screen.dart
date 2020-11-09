import 'package:flutter/material.dart';
import 'package:liztag/screens/advertisements_list/components/body.dart';

class AdvertisementsListScreen extends StatelessWidget {
  final String title;

  const AdvertisementsListScreen({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(title: title,),
      ),
    );
  }
}
