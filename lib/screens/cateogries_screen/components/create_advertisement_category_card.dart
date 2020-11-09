import 'package:flutter/material.dart';

class CreateAdvertisementCategoryCard extends StatelessWidget {
  const CreateAdvertisementCategoryCard({
    Key key, this.onTap, this.image, this.title,
  }) : super(key: key);

  final Function onTap;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size.width,
            height: 130,
            margin: EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.cover),

            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
          ),
        )
      ],
    );
  }
}

