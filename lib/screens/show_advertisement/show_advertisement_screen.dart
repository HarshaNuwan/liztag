import 'package:flutter/material.dart';
import 'package:liztag/screens/show_advertisement/components/body.dart';

class ShowAdvertisement extends StatelessWidget {
  final String advertisementName;

  const ShowAdvertisement({Key key, this.advertisementName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(advertisementName: advertisementName,),
      ),
    );
  }
}
