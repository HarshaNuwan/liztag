class ImageModel{
  String _imagePath;

  ImageModel(this._imagePath);

  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    _imagePath = parsedJson['imagePath'];
  }

  String get imagePath => _imagePath;
}