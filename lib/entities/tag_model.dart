class TagModel{
  String _tagName;
  int _tagType;

  TagModel(String tagName){
    _tagName = tagName;
  }

  TagModel.withTagType(int tagType, String tagName){
    _tagType = tagType;
    _tagName = tagName;

  }

  TagModel.fromJson(Map<String, dynamic> parsedJson){
    _tagName = parsedJson["tagName"];
  }

  String get tagName => _tagName;
  int get tagType => _tagType;
}