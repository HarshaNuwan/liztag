import 'dart:io';

import 'package:flutter/material.dart';
import 'package:liztag/components/app_bar_with_back_button_and_title.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/advertisements_list/components/advertisement_action_pane.dart';
import 'package:liztag/screens/advertisements_list/components/advertisementcard.dart';
import 'package:liztag/screens/show_advertisement/show_advertisement_screen.dart';

class Body extends StatelessWidget {
  final String title;

  const Body({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBarWithBackButtonAndTitle(
          title: title,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AdvertisementCard(
                  name: "House for sale in Kadawatha",
                  image: "assets/images/home1.jpg",
                  price: "LKR 1500000.00",
                  views: "25",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAdvertisement(
                                  advertisementName:
                                      "House for sale in Kadawatha",
                                )));
                  },
                ),
                AdvertisementCard(
                  name: "House for rent in Mountlavenia",
                  image: "assets/images/home1.jpg",
                  price: "LKR 2500000.00",
                  views: "10",
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAdvertisement(
                              advertisementName:
                              "House for rent in Mountlavenia",
                            )));
                  },
                ),
                AdvertisementCard(
                  name: "House for sale in Kurunegala",
                  image: "assets/images/home1.jpg",
                  price: "LKR 3300000.00",
                  views: "6",
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowAdvertisement(
                              advertisementName:
                              "House for sale in Kurunegala",
                            )));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
