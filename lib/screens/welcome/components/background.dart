import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // this size provide us total height and width of the screen
    return Container(
      color: kPrimaryColor,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[child],
      ),
    );
  }
}
