import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class AdvertisementActionPane extends StatelessWidget {
  const AdvertisementActionPane({
    Key key,
    this.favoritePress,
    this.sharePress,
    this.locationPress, this.views,
  }) : super(key: key);

  final Function favoritePress, sharePress, locationPress;
  final String views;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
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
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
            "Views ${views}",
    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
