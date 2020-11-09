import 'package:flutter/material.dart';

class RoundedButtonExtraSmall extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButtonExtraSmall({
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
        //padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    );
  }
}
