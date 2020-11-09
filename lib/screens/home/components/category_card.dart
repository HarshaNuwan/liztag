import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key, this.image, this.press, this.name,
  }) : super(key: key);

  final String image, name;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Container(
            width: size.width * 0.6,
            height: 185,
            margin: EdgeInsets.only(left: kDefaultPadding,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: kDefaultPadding,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
          ),
        )
      ],
    );
  }
}