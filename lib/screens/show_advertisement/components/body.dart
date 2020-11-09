import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/components/rounded_button_small.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/show_advertisement/components/advertisement_action_pane.dart';
import 'package:liztag/screens/show_advertisement/components/advertisement_avatar.dart';
import 'package:liztag/screens/show_advertisement/components/image_carousel.dart';

class Body extends StatelessWidget {

  final String advertisementName;

  const Body({Key key, this.advertisementName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ImageCarousel(
                images: getImages(),
              ),
              Positioned(
                top: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: kPrimaryColor,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                bottom: 45,
                child: Container(
                  padding: EdgeInsets.only(bottom:20, left: 15, right: 15, top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                      color: kPrimaryLightColor.withOpacity(0.75),
                    ),
                  height: 80,

                  width: size.width,
                    child: Text(advertisementName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),)),
              ),
              Positioned(
                bottom: 10,
                child: AdvertisementActionPane(favoritePress: (){},locationPress: (){}, sharePress: (){}, ),
              ),
              Positioned(
                right: 10,
                bottom: 15,
                child: AdvertisementAvatar(name: "Harsha",),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButtonSmall(color: kPrimaryColor,press: (){}, text: "Call", textColor: Colors.white,),
                    RoundedButtonSmall(color: kPrimaryColor,press: (){}, text: "Message", textColor: Colors.white,),
                    RoundedButtonSmall(color: kPrimaryColor,press: (){}, text: "More from this seller", textColor: Colors.white,),
                  ],
                ),
                //Text("House for sale in Kadawatha ", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text("LKR 1500000.00", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),),
                SizedBox(height: 15,),
                Text("Listings", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Rooms 2, Electricity, WIFI, Water, Telephone, Rooms 2, Electricity, WIFI, Water, Telephone,Rooms 2, Electricity, WIFI, Water, Telephone, "
                    "Rooms 2, Electricity, WIFI, Water, Telephone,Rooms 2, Electricity, WIFI, Water, Telephone, Rooms 2, Electricity, WIFI, Water, Telephone,Rooms 2, Electricity, WIFI, Water, Telephone, Rooms 2, Electricity, WIFI, Water, Telephone,Rooms 2, Electricity, WIFI, Water, Telephone, ", style: TextStyle(fontSize: 14,)),
                SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
    );
  }

  //need to remove this and implement proper way to load images
  List<AssetImage> getImages() {
    List<AssetImage> images = [];
    for (int i = 0; i < 5; i++) {
      images.add(AssetImage("assets/images/home1.jpg"));
    }
    return images;
  }
}




