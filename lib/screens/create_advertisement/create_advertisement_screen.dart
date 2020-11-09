import 'package:flutter/material.dart';
import 'package:liztag/screens/create_advertisement/components/body.dart';

class CreateAdvertisementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );;
  }
}
