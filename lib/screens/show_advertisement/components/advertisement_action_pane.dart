import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class AdvertisementActionPane extends StatelessWidget {
  const AdvertisementActionPane({
    Key key,
    this.favoritePress,
    this.sharePress,
    this.locationPress,
  }) : super(key: key);

  final Function favoritePress, sharePress, locationPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      width: size.width,

      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: favoritePress,
            color: kPrimaryColor,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: sharePress,
            color: kPrimaryColor,
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: locationPress,
            color: kPrimaryColor,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Text(
            "Views 0",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
