import 'package:liztag/entities/tag_model.dart';

import 'image_model.dart';

class AdvertisementModel {
  int _advertisementId;
  String _name;
  String _price;
  bool _isBoosted;
  List<TagModel> _tags = [];
  List<ImageModel> _images = [];
  bool _isLastItem = false;
  int _viewCount;
  double _lat;
  double _lng;

  AdvertisementModel(this._name, this._price, this._isBoosted);

  AdvertisementModel.withIdAndTags(int advertisementId, String name, String price,
      bool isBoosted, List<TagModel> tags) {
    _advertisementId = advertisementId;
    _name = name;
    _price = price;
    _isBoosted = isBoosted;
    _tags = tags;
  }

  AdvertisementModel.withImages(int advertisementId, String name, String price,
      bool isBoosted, List<TagModel> tags, List<ImageModel> images, bool isLastItem, int viewCount, double lat, double lng){
    _advertisementId = advertisementId;
    _name = name;
    _price = price;
    _isBoosted = isBoosted;
    _tags = tags;
    _images = images;
    _isLastItem = isLastItem;
    _viewCount = viewCount;
    _lat = lat;
    _lng = lng;
  }

  factory AdvertisementModel.fromJson(dynamic json) {
    List<TagModel> __tags;
    List<ImageModel> __images;
    if (json['tags'] != null) {
      var tagObjectJson = json['tags'] as List;
      __tags = tagObjectJson.map((tagJson) => TagModel.fromJson(tagJson)).toList();

    }
    if(json['images'] != null) {
      var imageObjectJson = json['images'] as List;
      __images = imageObjectJson.map((imageJson) => ImageModel.fromJson(imageJson)).toList();
    }

    AdvertisementModel advertisement = AdvertisementModel.withImages(
        json['advertisementId'], json['name'], json['price'], json['isBoosted'], __tags, __images, json['isLastItem'], json['viewCount'], json['lat'],json['lng']);

    return advertisement;
  }

  void addTag(TagModel tag) {
    _tags.add(tag);
  }

  void setIsLastItem(bool isLastItem) {
    _isLastItem = isLastItem;
  }

  int get advertisementId => _advertisementId;
  String get name => _name;
  String get price => _price;
  bool get isBoosted => _isBoosted;
  List<TagModel> get tags => _tags;
  List<ImageModel> get images => _images;
  bool get isLastItem => _isLastItem;
  int get viewCount => _viewCount;
  double get lat => _lat;
  double get lng => _lng;
}
