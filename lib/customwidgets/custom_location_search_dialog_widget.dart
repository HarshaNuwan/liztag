import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart' show AutocompletePrediction, DetailsResult, GooglePlace;
import 'package:liztag/models/filter_tags_model.dart';
import 'package:provider/provider.dart';

class CustomLocationSearchDialog extends StatefulWidget {
  @override
  _CustomLocationSearchDialogState createState() =>
      _CustomLocationSearchDialogState();
}

class _CustomLocationSearchDialogState
    extends State<CustomLocationSearchDialog> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  DetailsResult _detailsResult;
  TextEditingController _tController = TextEditingController();

  @override
  void initState() {
    String apiKey =
        'AIzaSyC8Dkxgci10_eEUUy_a63IbVnNm4-NuRo0'; //DotEnv().env['API_KEY'];
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 400.0,
          padding: EdgeInsets.only(
            top: 20.0,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                'Where are you looking for?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  height: 200.0,
                  margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: TextField(
                          controller: _tController,
                          decoration: InputDecoration(
                            labelText: "Search",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              autoCompleteSearch(value);
                            } else {
                              if (predictions.length > 0 && mounted) {
                                setState(() {
                                  predictions = [];
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: predictions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 18.0,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ),
                              title: Text(
                                predictions[index].description,
                                style: TextStyle(fontSize: 14.0),
                              ),
                              onTap: () async {
                                await getDetils(predictions[index].placeId);

                                if (_detailsResult != null) {
                                  if (_detailsResult.geometry != null) {
                                    _tController.text =
                                        predictions[index].description;
                                    setState(() {
                                      predictions.clear();
                                      print(
                                          _detailsResult.geometry.location.lat);
                                    });
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    context.read<FilterTagsModel>().setFilterTagButtonVisible = true;
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text('Search'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }

  void getDetils(String placeId) async {
    var result = await this.googlePlace.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        _detailsResult = result.result;
      });
    }
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
