import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart'
    show AutocompletePrediction, DetailsResult, GooglePlace;
import 'package:liztag/customwidgets/custom_location_search_dialog_widget.dart';
import 'package:liztag/models/location_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AutoSuggetsLocation(),
    );
  }
}

class AutoSuggetsLocation extends StatefulWidget {
  @override
  _AutoSuggetsLocationState createState() => _AutoSuggetsLocationState();
}

class _AutoSuggetsLocationState extends State<AutoSuggetsLocation> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    String apiKey =
        'AIzaSyC8Dkxgci10_eEUUy_a63IbVnNm4-NuRo0'; //DotEnv().env['API_KEY'];
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  DetailsResult _detailsResult;

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Where are you looking for?",
              textDirection: TextDirection.ltr,
            ),
            content: Container(
              height: 200.0,
              margin: EdgeInsets.only(right: 20, left: 20, top: 20),
              child: Column(
                children: <Widget>[
                  TextField(
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
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: predictions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.pin_drop,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(predictions[index].description),
                          onTap: () {
                            debugPrint(predictions[index].placeId);
                            getDetils(predictions[index].placeId);
                            if (_detailsResult != null) {
                              if (_detailsResult.geometry != null) {
                                //print(detailsResult.geometry.location.lat.toString());
                              }
                            }
                            //print(detailsResult.geometry.location.lng.toString());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showDialog2() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Select filter tags"),
              content: Stack(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(top:60.0),
                    color: Colors.amberAccent,
                    height: 300.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ListView.builder(
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.pin_drop,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(predictions[index].description),
                            onTap: () {
                              debugPrint(predictions[index].placeId);
                              getDetils(predictions[index].placeId);
                              if (_detailsResult != null) {
                                if (_detailsResult.geometry != null) {
                                  //print(detailsResult.geometry.location.lat.toString());
                                }
                              }
                              //print(detailsResult.geometry.location.lng.toString());
                            },
                          );
                        }),
                  ),
                  TextField(
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
                      setState(() {
                        if (value.isNotEmpty) {
                          autoCompleteSearch(value);
                        } else {
                          if (predictions.length > 0 && mounted) {
                            setState(() {
                              predictions = [];
                            });
                          }
                        }
                      });

                    },
                  )
                ],
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

  TextEditingController _tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
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
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Where are you looking for?",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25.0),

                        )),
                    RaisedButton(
                      child: Text('Search'),
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context) => CustomLocationSearchDialog());
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(

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
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: predictions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(predictions[index].description),
                              onTap: () async {
                                debugPrint(predictions[index].placeId);
                                await getDetils(predictions[index].placeId);
                                if (_detailsResult != null) {
                                  if (_detailsResult.geometry != null) {
                                    _tController.text =
                                        predictions[index].description;
                                    //LocationModel locationModel = LocationModel(_detailsResult.geometry.location.lat, _detailsResult.geometry.location.lng);
                                    //Navigator.pop(context, locationModel);
                                    setState(() {
                                      predictions.clear();
                                      print(
                                          _detailsResult.geometry.location.lat);
                                    });
                                  }
                                }

                                //print(detailsResult.geometry.location.lng.toString());
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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
