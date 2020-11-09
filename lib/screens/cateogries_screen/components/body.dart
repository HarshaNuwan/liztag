import 'package:flutter/material.dart';
import 'package:liztag/components/app_bar_with_back_button_and_title.dart';
import 'package:liztag/screens/cateogries_screen/components/create_advertisement_category_card.dart';
import 'package:liztag/screens/create_advertisement/create_advertisement_screen.dart';

class Body extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          AppBarWithBackButtonAndTitle(
            title: "Select Category",
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0,right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreateAdvertisementCategoryCard(image: "assets/images/home1.jpg", title: "House", onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateAdvertisementScreen()));
                    },),
                    CreateAdvertisementCategoryCard(image: "assets/images/home1.jpg", title: "Apartment", onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateAdvertisementScreen()));
                    },),
                    CreateAdvertisementCategoryCard(image: "assets/images/home1.jpg", title: "Room", onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateAdvertisementScreen()));
                    },),
                    CreateAdvertisementCategoryCard(image: "assets/images/home1.jpg", title: "Studio", onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateAdvertisementScreen()));
                    },),
                    CreateAdvertisementCategoryCard(image: "assets/images/home1.jpg", title: "Office Space", onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateAdvertisementScreen()));
                    },)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

