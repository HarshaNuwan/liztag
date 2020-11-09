import 'package:flutter/material.dart';
import 'package:liztag/autosuggest.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show
        CameraPosition,
        CameraUpdate,
        GoogleMap,
        GoogleMapController,
        LatLng,
        MapType;

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414);
  final _isAddTagVisible = true;

  @override
  Widget build(BuildContext context) {

    final drawer = Drawer(
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
              onPressed: () {},
              color: Colors.red,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(
          color: Colors.grey[500],
        ),
        titleSpacing: 0.0,
        title: Text(
          "Liztag",
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),

      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Wrap(
              children: [
                Chip(
                  shape: StadiumBorder(side: BorderSide()),
                  backgroundColor: Colors.white,
                  onDeleted: () {},
                  deleteIcon: Icon(
                    Icons.close,
                    size: 14.0,
                  ),
                  label: Text('House'),
                  labelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                    shape: StadiumBorder(side: BorderSide()),
                    backgroundColor: Colors.white,
                    onDeleted: () {},
                    deleteIcon: Icon(
                      Icons.close,
                      size: 14,
                    ),
                    label: Text('Rooms 2'),
                    labelStyle: TextStyle(fontSize: 14.0, color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
      drawer: drawer,
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: "list",
                onPressed: () {},
                child: Icon(Icons.list),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                visible: _isAddTagVisible,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.purple,
                  label: Text("Add Tags"),
                  heroTag: "addtag",
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "search",
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => AutoSuggetsLocation()),
    );
    //print(">>>> " + result.longitude + " >>>> " + result.latitude);

    CameraPosition newLocation = CameraPosition(
        target: LatLng(result.latitude, result.longitude),
        zoom: 15);
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newLocation));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
