import 'package:flutter/material.dart';
import 'package:liztag/screens/home/components/hot_deals_card.dart';
import 'package:liztag/screens/show_advertisement/show_advertisement_screen.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          HotDealsCard(
            image: "assets/images/home1.jpg",
            name: "House for sale in Kadawatha",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowAdvertisement(advertisementName: "House for sale in Kadawatha",)));
            },
            price: "Rs. 1500000.00",
          ),
          HotDealsCard(
            image: "assets/images/home1.jpg",
            name: "House for sale in Kandy",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowAdvertisement(advertisementName: "House for sale in Matale",)));
            },
            price: "Rs. 400000.00",
          ),
          HotDealsCard(
            image: "assets/images/home1.jpg",
            name: "House for sale in Matale",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowAdvertisement(advertisementName: "House for sale in Kesbewa",)));
            },
            price: "Rs. 330000.00",
          ),
          HotDealsCard(
            image: "assets/images/home1.jpg",
            name: "House for sale in Gelioya",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowAdvertisement(advertisementName: "House for sale in Kurunegala",)));
            },
            price: "Rs. 2000000.00",
          ),
        ],
      ),
    );
  }
}
