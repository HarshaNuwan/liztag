import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/screens/my_advertisements/my_advertisements_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        child: Icon(Icons.person, size: 30, color: Colors.white,),
                      ),
                      Text('Harsha', style: TextStyle(color: kPrimaryLightColor),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('My Advertiesments'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyAdvertisementsScreen()));
                },
              ),
              ListTile(
                title: Text('Favorites'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text(
                    'Post New Advertiesmment',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                  },
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}