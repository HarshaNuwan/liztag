import 'package:liztag/entities/tag_model.dart';
import 'package:flutter/foundation.dart';

class FilterTagsModel with ChangeNotifier, DiagnosticableTreeMixin{
  bool _isAddTagButtonVisible = false;
  List<TagModel> _filterTags = [];
  List<TagModel> _filterTagsSelectable = [];

  bool get isFilterTagButtonVisible => _isAddTagButtonVisible;
  set setFilterTagButtonVisible(bool isAddTagButtonVisible){ _isAddTagButtonVisible = isAddTagButtonVisible;
  notifyListeners();}

  List<TagModel> get filterTags => _filterTags;
  List<TagModel> get filterTagsSelectable => _filterTagsSelectable;

  FilterTagsModel(){
    TagModel t1 = TagModel.withTagType(0, "Properties nearby");
    TagModel t2 = TagModel.withTagType(1, "Rooms");
    TagModel t3 = TagModel.withTagType(1, "Bathrooms");
    TagModel t4 = TagModel.withTagType(1, "Electricity");
    TagModel t5 = TagModel.withTagType(1, "Water");
    TagModel t6 = TagModel.withTagType(1, "Floors");
    TagModel t7 = TagModel.withTagType(1, "Wifi");

    _filterTagsSelectable.add(t1);
    _filterTagsSelectable.add(t2);
    _filterTagsSelectable.add(t3);
    _filterTagsSelectable.add(t4);
    _filterTagsSelectable.add(t5);
    _filterTagsSelectable.add(t6);
    _filterTagsSelectable.add(t7);
  }

}