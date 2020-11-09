import 'package:flutter/material.dart';
import 'package:liztag/services/api_provider.dart';

import 'entities/user_entity.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  List _cities = [
    "Country",
    "Sri Lanka",
    "Singapore",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      border: Border.all(width: 0.5),
      borderRadius: BorderRadius.all(
          Radius.circular(15.0) //         <--- border radius here
          ),
    );

    final countrySpinner = DropdownButton(
      isExpanded: true,
      value: _currentCity,
      items: _dropDownMenuItems,
      onChanged: changedDropDownItem,
    );

    final phoneNumber = TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "phone number",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final name = TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "name",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "email",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final submitButton = RaisedButton(
      onPressed: () {
       /*// UserModel signUpUser = UserModel(0, _currentCity, nameController.text,
            phoneController.text, emailController.text, '');
        final apiProvider = ApiProvider();
        //apiProvider.signUp(signUpUser);*/
      },
      child: Text(
        "Submit",
        style: TextStyle(
            color: Colors.white,

            ),
        textDirection: TextDirection.ltr,
      ),
      color: Colors.blue,
    );

    return Material(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Center(
          child: Container(
            height: 510.0,
            child: Column(
              children: <Widget>[
                Text(
                  "Liztag",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 350,
                  decoration: boxDecoration,
                  child: Column(
                    children: <Widget>[
                      Text("Sign Up",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0,
                          )),
                      SizedBox(height: 20.0),
                      countrySpinner,
                      SizedBox(height: 15.0),
                      phoneNumber,
                      SizedBox(height: 15.0),
                      name,
                      SizedBox(height: 15.0),
                      email
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                submitButton
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
