import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key key, this.title, this.press,
  }) : super(key: key);

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Spacer(),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: kPrimaryColor,
                  onPressed: press,
                  child: Text("More", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}