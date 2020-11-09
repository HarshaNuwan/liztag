import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/components/app_bar_with_back_button_and_title.dart';
import 'package:liztag/components/rounded_button_extra_small.dart';
import 'package:liztag/components/rounded_button_small.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/cateogries_screen/categories_screen.dart';
import 'package:liztag/screens/my_advertisements/components/empty_advertisement_card.dart';
import 'package:liztag/screens/my_advertisements/components/my_advertisement_card.dart';
import 'package:liztag/screens/my_advertisements/components/subscription_plan_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.6,
            padding: EdgeInsets.only(top: 80, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MyAdvertisementCard(image: "assets/images/home1.jpg", name: "House for sale in Kadawatha", price: "LKR 1500000.00", status: "Active",),
                  MyAdvertisementCard(image: "assets/images/home1.jpg", name: "House for sale in Kandy", price: "LKR 2500000.00", status: "Deactive",),
                  EmptyAdvertisementCard(onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CategoriesScreen()));
                  },),
                  EmptyAdvertisementCard(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CategoriesScreen()));
                    },
                  ),
                  EmptyAdvertisementCard(onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CategoriesScreen()));
                  },),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Subscription Plans",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: size.height * 0.32,
                  width: size.width,
                  padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SubscriptionPlanCard(
                          title: "Current Plan",
                          planeType: "Individual 2 Ads",
                          plnaValue: "0\$",
                          cardColor: Colors.white,
                        ),
                        SubscriptionPlanCard(
                          title: "Entry",
                          planeType: "5 Ads",
                          plnaValue: "2.50\$",
                          cardColor: Colors.teal,
                        ),
                        SubscriptionPlanCard(
                          title: "Medium",
                          planeType: "10 Ads",
                          plnaValue: "5.50\$",
                          cardColor: Colors.amber,
                        ),
                        SubscriptionPlanCard(
                          title: "Enterprise",
                          planeType: "45 Ads",
                          plnaValue: "35.50\$",
                          cardColor: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: AppBarWithBackButtonAndTitle(
              title: "My Advertisements",
            ),
          ),
        ],
      ),
    );
  }
}


