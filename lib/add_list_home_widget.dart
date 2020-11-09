import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liztag/autosuggest.dart';
import 'package:liztag/componentswidgets/drawerwidget.dart';
import 'package:carousel_pro/carousel_pro.dart' show Carousel, DotPosition;
import 'package:liztag/services/api_provider.dart';

import 'customwidgets/custom_location_search_dialog_widget.dart';
import 'customwidgets/custom_tags_selection_dialog_widget.dart';
import 'entities/advertisement_model.dart';
import 'entities/tag_model.dart';
import 'map_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'models/filter_tags_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DotEnv().load('.env');
//  runApp(MaterialApp(home: AdvertisementListHomeWidget()));

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterTagsModel()),
      ],
      child: MaterialApp(home: AdvertisementListHomeWidget()),
    ),
  );
}

class AdvertisementListHomeWidget extends StatefulWidget {
  @override
  _AdvertisementListHomeWidgetState createState() =>
      _AdvertisementListHomeWidgetState();
}

class _AdvertisementListHomeWidgetState  extends State<AdvertisementListHomeWidget> {
  final ApiProvider apiProvider = ApiProvider();

  List<AdvertisementModel> advertisements = [];
  List<TagModel> _tags = [];
  List<TagModel> _selectionTags = [];
  double __tagContainerHeight = 45.0;

  TagModel t1 = TagModel.withTagType(0, "Properties nearby");
  TagModel t2 = TagModel.withTagType(1, "Rooms");
  TagModel t3 = TagModel.withTagType(1, "Bathrooms");
  TagModel t4 = TagModel.withTagType(1, "Electricity");
  TagModel t5 = TagModel.withTagType(1, "Water");
  TagModel t6 = TagModel.withTagType(1, "Floors");
  TagModel t7 = TagModel.withTagType(1, "Wifi");

  bool _isAddTagVisible = false;
  bool _isTagPaneVisible = true;
  double _advertisementContainerTopHeight = 60.0;
  double latitude;
  double longitude;
  //List<AdvertisementModel> advertisements;

  @override
  void initState() {
    _tags.add(t1);
    _selectionTags.add(t2);
    _selectionTags.add(t3);
    _selectionTags.add(t4);
    _selectionTags.add(t5);
    _selectionTags.add(t6);
    _selectionTags.add(t7);

    _getInitialAdvertisements().then((value) => setState(() {
      advertisements = value;
    }));
    super.initState();
  }

  final nameTextStyle = TextStyle(
      fontSize: 18.0, color: Colors.grey[900], fontWeight: FontWeight.bold);

  final priceTextStyle = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  bool _mapButtonVisibility = false;

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
        drawer: MainDrawer(),
        body: _getAdvertisementContainer(),
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                  visible: _mapButtonVisibility,
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    heroTag: "showOnMap",
                    onPressed: () {
                      _showAdvertisementsOnMap();
                    },
                    child: Icon(Icons.map),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 31.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: context.watch<FilterTagsModel>().isFilterTagButtonVisible,
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.purple,
                    label: Text("Add Tags"),
                    heroTag: "addtag",
                    icon: Icon(Icons.add),
                    onPressed: () {
                      showDialog(context: context, builder: (BuildContext context) => CustomTagsSelectionDialog());
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                heroTag: "search",
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context) => CustomLocationSearchDialog());
                  //_navigateAndDisplaySelection(context);
                },
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  Show tags selection dialog box
   */

  _getAdvertisementContainer() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: _advertisementContainerTopHeight),
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                            itemCount: advertisements.length,
                            itemBuilder: (context, index) {
                              return getListItemContainer(
                                  advertisements[index]);
                            }))
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: _isTagPaneVisible,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              padding: const EdgeInsets.only(left: 5.0),
              height: __tagContainerHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tags.length,
                  itemBuilder: (context, index) {
                    return _getUpdatedTags(_tags[index], index);
                  }),
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Select filter tags"),
              content: Container(
                color: Colors.amberAccent,
                height: 300.0,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ListView.builder(
                    itemCount: _selectionTags.length,
                    itemBuilder: (context, index) {
                      return _createTagForTagList(_selectionTags[index], index);
                    }),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDialog2(TagModel tag, int index) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(tag.tagName),
          content: Text("Add this tag"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Add"),
              onPressed: () {
                setState(() {
                  _selectionTags.removeAt(index);

                  if (_tags.length == 1) {
                    if (_tags[0].tagType == 0) {
                      _tags.removeAt(0);
                    }
                  }

                  if (!_isTagPaneVisible) {
                    _isTagPaneVisible = true;
                    _advertisementContainerTopHeight = 60.0;
                  }
                  _tags.add(tag);
                  Navigator.of(context).pop();
                });
              },
            ),
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _createTagForTagList(TagModel tag, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.local_offer,
          color: Colors.white,
        ),
      ),
      title: Text(tag.tagName),
      onTap: () {
        setState(() {
          _showDialog2(tag, index);
        });
      },
    );
  }

  Widget getListItemContainer(AdvertisementModel advertisement) {
    double wrapperBottomPadding = 8.0;
    if (advertisement.isLastItem) {
      wrapperBottomPadding = 100.0;
    }

    List<NetworkImage> images = [];
    if (advertisement.images.length > 0) {
      for (var img in advertisement.images) {
        images.add(NetworkImage(img.imagePath));
      }
    }

    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          print("Tapped");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: Text(
                advertisement.name,
                textDirection: TextDirection.ltr,
                style: nameTextStyle,
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.green,
                  height: 300.0,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    autoplay: false,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 6.0,
                    dotIncreasedColor: Color(0xFFFF335C),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: images,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 30.0,
                  child: Container(
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.transparent),
                        borderRadius: const BorderRadius.only(
                            topRight: const Radius.circular(30.0),
                            bottomRight: const Radius.circular(30.0)),
                        color: new Color.fromRGBO(0, 0, 0,
                            0.5) // Specifies the background color and the opacity
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      advertisement.price,
                      textDirection: TextDirection.ltr,
                      style: priceTextStyle,
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            apiProvider.updateUserFavoriteAdd(
                                advertisement.advertisementId);
                          },
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Icon(Icons.share),
                        SizedBox(
                          width: 25.0,
                        ),
                        IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MapWidget.withGeoCodesAndAdvertisement(
                                            advertisement.lat,
                                            advertisement.lng,
                                            advertisement)));
                          },
                        ),
                        Spacer(),
                        Text(
                          "Views ${advertisement.viewCount}",
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: wrapperBottomPadding),
                    child: Wrap(
                        direction: Axis.horizontal,
                        children: _getChips(advertisement.tags)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<AdvertisementModel>> _getInitialAdvertisements() async {
    advertisements =
    await apiProvider.fetchAdvertisementsByGeoCodes(longitude, latitude);
    return advertisements;
  }

  Widget _getUpdatedTags(TagModel tag, int index) {
    Chip c;
    if (tag.tagType == 0) {
      c = Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(side: BorderSide()),
        backgroundColor: Colors.white,
        label: Text(tag.tagName),
        labelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
      );
    } else {
      c = Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(side: BorderSide()),
        backgroundColor: Colors.white,
        onDeleted: () {
          setState(() {
            _tags.removeAt(index);
            _selectionTags.add(tag);

            if (_tags.length == 0) {
              _isTagPaneVisible = false;
              _advertisementContainerTopHeight = 0.0;
            }
          });
        },
        deleteIcon: Icon(
          Icons.close,
          size: 14.0,
          color: Colors.red,
        ),
        label: Text(tag.tagName),
        labelStyle: TextStyle(fontSize: 14.0, color: Colors.black),
      );
    }

    Container con = Container(
      child: Row(
        children: <Widget>[
          c,
          SizedBox(
            width: 10.0,
          )
        ],
      ),
    );

    return con;
  }

  /*
   * _navigateAndDisplaySelection route to a search widget with auto suggest capability for locations.
   * once the location is selected, latitude and logitude is passed back for query the database. Geo codes are
   * sent to the api provider to query available advertisements near the selected geo location.
   * if there are results, it will enable the show result on map button, else it will be hided.
   */
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => AutoSuggetsLocation()),
    );

    if (result != null) {
      longitude = result.longitude;
      latitude = result.latitude;
      if (null != latitude && null != longitude) {
        setState(() {
          apiProvider
              .fetchAdvertisementsByGeoCodes(longitude, latitude)
              .then((value) => () {
            advertisements = value;
          });
          if (advertisements.length > 0) {
            _isAddTagVisible = true;
            _mapButtonVisibility = true;
          } else {
            _mapButtonVisibility = false;
            _isAddTagVisible = false;
          }
        });
      }
    }
  }

  _showAdvertisementsOnMap() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MapWidget.withAdvertisements(
                longitude, latitude, advertisements)));
  }

  List<Widget> _getChips(List<TagModel> tags) {
    List<Widget> chips = [];
    for (var i = 0; i < tags.length; i++) {
      Text text = Text(
        tags[i].tagName,
        textDirection: TextDirection.ltr,
      );
      if (i != (tags.length - 1) && i != 0) {
        chips.add(Text(
          " | ",
          textDirection: TextDirection.ltr,
        ));
        chips.add(Text(
          " ",
          textDirection: TextDirection.ltr,
        ));
        //chips.add(Icon(Icons.local_offer));

      }
      /* Chip newChip = Chip(
        shape: StadiumBorder(side: BorderSide()),
        backgroundColor: Colors.white,
        label: Text(
          tags[i].tagName,
          textDirection: TextDirection.ltr,
        ),

      );*/
      chips.add(text);
      chips.add(SizedBox(
        width: 10.0,
      ));
    }
    return chips;
  }
}
