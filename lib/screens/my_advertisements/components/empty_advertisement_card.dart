import 'package:flutter/material.dart';

class EmptyAdvertisementCard extends StatelessWidget {
  const EmptyAdvertisementCard({
    Key key, this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          height: 120,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Empty",
                style: TextStyle(fontSize: 30, color: Colors.grey[500]),
              ),
              Text(
                "Tap to create a new advertisement",
                style: TextStyle(fontSize: 15, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}