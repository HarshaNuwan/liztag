class LocationModel{
  double _latitude;
  double _longitude;

  LocationModel(lat, lng){
    _latitude = lat;
    _longitude = lng;
  }

  double get latitude => _latitude;
  double get longitude => _longitude;
}