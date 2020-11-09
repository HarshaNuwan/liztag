import 'package:flutter/material.dart';
import 'package:liztag/constants.dart';
import 'package:liztag/entities/country_entity.dart';
import 'package:liztag/models/sign_up_screen_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class RoundedDropDownButton extends StatefulWidget {
  final List<DropdownMenuItem<String>> itemList;

  const RoundedDropDownButton({Key key, this.itemList});

  @override
  _RoundedDropDownButton createState() => _RoundedDropDownButton(itemList);
}

class _RoundedDropDownButton extends State<RoundedDropDownButton> {
  List<DropdownMenuItem<String>> itemList;

  String country;
  _RoundedDropDownButton(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.language,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: DropdownButtonFormField(
              decoration: InputDecoration(enabledBorder: InputBorder.none),
              hint: Text("Select your country"),
              isExpanded: true,
              items: itemList,
              value: country,
              onChanged: (String value) {
                setState(() {
                  country = value;
                  context.read<CountryEntity>().countryId = int.parse(value);
                  context.read<SignUpScreenModel>().selectedCountry = context.read<SignUpScreenModel>().countryList[int.parse(value)];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
