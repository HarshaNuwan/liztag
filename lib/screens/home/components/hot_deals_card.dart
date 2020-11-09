import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';

class HotDealsCard extends StatelessWidget {
  const HotDealsCard({
    Key key, this.name, this.price, this.image, this.press,

  }) : super(key: key);

  final String name, price, image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 10, bottom: 30),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),

              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 25,
                      color: kPrimaryColor.withOpacity(0.23)
                  )],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(price, overflow: TextOverflow.ellipsis,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}