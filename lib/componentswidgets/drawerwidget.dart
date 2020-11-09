import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  Text('Profile'),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
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
              // Update the state of the app.
              // ...
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
    );
  }
}
