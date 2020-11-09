import 'package:flutter/material.dart';
import 'package:liztag/components/rounded_button_extra_small.dart';
import 'package:liztag/constants.dart';

class MyAdvertisementCard extends StatelessWidget {
  const MyAdvertisementCard({
    Key key, this.image, this.status, this.name, this.price,
  }) : super(key: key);

  final String image, status, name, price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 130,
        width: size.width,
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                        AssetImage(image),
                        fit: BoxFit.cover))),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text(
                    status,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[8]),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[8]),
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 14, color: Colors.grey[8]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RoundedButtonExtraSmall(color: kPrimaryColor, textColor: Colors.white, text: "Edit", press: (){},),
                      RoundedButtonExtraSmall(color: kPrimaryColor, textColor: Colors.white, text: "Delete", press: (){},),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}