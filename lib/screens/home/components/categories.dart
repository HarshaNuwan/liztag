import 'package:flutter/material.dart';
import 'package:liztag/screens/advertisements_list/advertisements_screen.dart';
import 'package:liztag/screens/home/components/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          CategoryCard(image: "assets/images/home1.jpg", press: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertisementsListScreen(title: "House",)));
          },name: "House",),
          CategoryCard(image: "assets/images/home1.jpg", press: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertisementsListScreen(title: "Apartment",)));
          }, name: "Apartment",),
          CategoryCard(image: "assets/images/home1.jpg", press: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertisementsListScreen(title: "Studio",)));
          }, name: "Studio",),
          CategoryCard(image: "assets/images/home1.jpg", press: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertisementsListScreen(title: "Office Space",)));
          }, name: "Office Space",),
          CategoryCard(image: "assets/images/home1.jpg", press: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdvertisementsListScreen(title: "Warehouse",)));
          }, name: "Warehouse",),
        ],
      ),
    );
  }
}