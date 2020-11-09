import 'package:flutter/material.dart';

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
      home: CategorySelectionWidget(),
    );
  }
}

class CategorySelectionWidget extends StatefulWidget {
  @override
  _CategorySelectionWidgetState createState() =>
      _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  List _categories = [
    "House",
    "Apartment",
    "Room",
    "Studio",
    "Anex",
    "Warehouse",
    "Office Space"
  ];
  List<DropdownMenuItem<String>> _categoryItems;
  String _currentCategory;

  @override
  void initState() {
    _categoryItems = getCategoryDropDownMenuItems();
    super.initState();
  }

  List<DropdownMenuItem<String>> getCategoryDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _categories) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final categoriesSpinner = DropdownButtonFormField(
      decoration: InputDecoration.collapsed(hintText: 'Select category'),
      isExpanded: true,
      value: _currentCategory,
      items: _categoryItems,
      onChanged: changedDropDownItem,

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What are you looking for?",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 25.0),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Colors.red, style: BorderStyle.solid, width: 0.80),
                ),
                child: categoriesSpinner)
          ],
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory;
    });
  }
}
