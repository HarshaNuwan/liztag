import 'package:flutter/material.dart';

class RoundedButtonSmall extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButtonSmall({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
