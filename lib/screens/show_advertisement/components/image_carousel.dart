import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    Key key, this.images,
  }) : super(key: key);

  final List<AssetImage> images;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      height: size.height * 0.55,
      width: size.width,
      child: Carousel(
        boxFit: BoxFit.cover,
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6.0,
        dotIncreasedColor: kPrimaryColor,
        dotBgColor: Colors.transparent,
        dotPosition: DotPosition.topRight,
        dotVerticalPadding: 10.0,
        showIndicator: true,
        indicatorBgPadding: 7.0,
        images: images,
      ),
    );
  }
}