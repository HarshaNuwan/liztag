import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard({
    Key key, this.title, this.planeType, this.plnaValue, this.cardColor,
  }) : super(key: key);

  final String title, planeType, plnaValue;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 10),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: kPrimaryColor.withOpacity(0.25))
          ]),
      height: 180,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style:
            TextStyle(fontSize: 20, color: Colors.grey[900]),
          ),
          Text(
            planeType,
            style:
            TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            plnaValue,
            style:
            TextStyle(fontSize: 30, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
