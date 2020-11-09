import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'entities/advertisement_model.dart';

class MapWidget extends StatefulWidget {
  double _latitude;
  double _longitude;

  _MapWidgetState _mapWidgetState;

  MapWidget() {
    _mapWidgetState = _MapWidgetState();
  }

  MapWidget.withGeoCodes(double lng, double lat) {
    _longitude = lng;
    _latitude = lat;
    _mapWidgetState = _MapWidgetState.withGeoCodes(_latitude, _longitude);
  }

  MapWidget.withGeoCodesAndAdvertisement(double lng, double lat, AdvertisementModel adv) {
    _longitude = lng;
    _latitude = lat;
    _mapWidgetState = _MapWidgetState.withGeoCodesAndAdvertisement(_latitude, _longitude, adv);
  }

  MapWidget.withAdvertisements(
      _latitude, _longitude, List<AdvertisementModel> advertisements) {
    _mapWidgetState = _MapWidgetState.withAdvertisements(
        _latitude, _longitude, advertisements);
  }

  @override
  _MapWidgetState createState() => _mapWidgetState;
}

class _MapWidgetState extends State<MapWidget> {
  double latitude;
  double longitude;
  AdvertisementModel advertisement;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<AdvertisementModel> _advertisements;

  @override
  dispose(){
    latitude = null;
    longitude = null;
    advertisement = null;
    markers = null;
    _advertisements = null;
    super.dispose();
  }

  _MapWidgetState();

  _MapWidgetState.withAdvertisements(
      double lng, double lat, List<AdvertisementModel> advertisements) {
    latitude = lng;
    longitude = lat;
    _advertisements = advertisements;
    _showAdvertisementsOnMap();
  }

  _MapWidgetState.withGeoCodes(double lng, double lat) {
    latitude = lat;
    longitude = lng;
    _gotoLocation();
  }

  _MapWidgetState.withGeoCodesAndAdvertisement(double lng, double lat, AdvertisementModel adv) {
    latitude = lat;
    longitude = lng;
    advertisement = adv;
    _gotoLocation();
  }

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  _gotoLocation() async {
    if (null != longitude && null != latitude) {
      MarkerId markerId = MarkerId("A");
      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          longitude,
          latitude,
        ),
        onTap: () {}
      );

      GoogleMapController controller = await _controller.future;

      setState(() {
        // adding a new marker to map
        markers[markerId] = marker;

        CameraPosition newLocation =
            CameraPosition(target: LatLng(longitude, latitude), zoom: 15);

        controller.animateCamera(CameraUpdate.newCameraPosition(newLocation));
      });
    }
  }

  _showAdvertisementsOnMap() async {
    if (null != longitude && null != latitude && null != _advertisements) {
      for (var adv in _advertisements) {
        MarkerId markerId = MarkerId(adv.advertisementId.toString());
        Marker marker = Marker(
          markerId: markerId,
          position: LatLng(
            adv.lng,
            adv.lat,
          ),
          onTap: () {
            _settingModalBottomSheet(context, adv);
          },
          icon: await getClusterMarker(
            adv.price,
            Colors.red,
            Colors.white,
            200,
          )
        );
        markers[markerId] = marker;
      }

      GoogleMapController controller = await _controller.future;
      setState(() {
        CameraPosition newLocation =
            CameraPosition(target: LatLng(longitude, latitude), zoom: 15);
        controller.animateCamera(CameraUpdate.newCameraPosition(newLocation));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          body: Container(
            child: Stack(
              children: <Widget>[
                GoogleMap(
                  zoomControlsEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.of(markers.values),
                )
              ],
            ),
          )),
    );
  }

  Future<BitmapDescriptor> getClusterMarker(
    String clusterSize,
    Color clusterColor,
    Color textColor,
    int width,
  ) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.red;
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final double radius = width / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      paint,
    );

    textPainter.text = TextSpan(
      text: clusterSize.toString(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        radius - textPainter.width / 2,
        radius - textPainter.height / 2,
      ),
    );

    final image = await pictureRecorder.endRecording().toImage(
          radius.toInt() * 2,
          radius.toInt() * 2,
        );

    final data = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  void _settingModalBottomSheet(context, AdvertisementModel adv){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: 300.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(adv.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                ),
                Text(adv.price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blue)),
                Expanded(
                    child: ListView.builder(
                        itemCount: adv.tags.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                child: Icon(
                                  Icons.local_offer,
                                  color: Colors.white,
                                )),
                            title: Text(adv.tags[index].tagName),
                          );
                        }))
              ],
            )
          );
        }
    );
  }
}
