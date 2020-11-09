import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class AdvertisementAvatar extends StatelessWidget {
  const AdvertisementAvatar({
    Key key, this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: kPrimaryColor,
          radius: 35,
          child: Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
        ),
        Text(name)
      ],
    );
  }
}