import 'package:flutter/material.dart';
import 'package:liztag/screens/my_advertisements/components/body.dart';

class MyAdvertisementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}



