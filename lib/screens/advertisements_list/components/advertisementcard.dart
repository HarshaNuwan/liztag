import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/advertisements_list/components/advertisement_action_pane.dart';

class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({
    Key key, this.name, this.image, this.price, this.views, this.onTap,
  }) : super(key: key);

  final String name, image, price, views;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                  ),
                  height: size.height * 0.4,
                  width: size.width,

                ),
                Positioned(
                  bottom: 60,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.50),
                    child: Text(
                      price,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 10,
                              color: kPrimaryColor.withOpacity(0.25))
                        ]
                    ),
                    height: 60,
                    width: size.width,
                    child: AdvertisementActionPane(favoritePress: (){}, sharePress: (){}, locationPress: (){}, views: views,),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}