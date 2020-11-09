import 'package:flutter/material.dart';
import 'package:liztag/screens/cateogries_screen/components/body.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Body(),
      ),
    );;
  }
}
