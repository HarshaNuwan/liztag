import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class AppBarWithBackButtonAndTitle extends StatelessWidget {
  const AppBarWithBackButtonAndTitle({
    Key key, this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius:
        BorderRadius.only(bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 10,
              color: kPrimaryColor.withOpacity(0.25))
        ],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}