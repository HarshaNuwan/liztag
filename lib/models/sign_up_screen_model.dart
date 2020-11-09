import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liztag/entities/country_entity.dart';

class SignUpScreenModel with ChangeNotifier, DiagnosticableTreeMixin {
  List<CountryEntity> _countryList = [];
  List<DropdownMenuItem<String>> _countryDropDownList = [];

  CountryEntity _selectedCountry;
  String _name;
  String _phoneNumber;
  String _email;

  SignUpScreenModel();
  SignUpScreenModel.withCountryList(this._countryList) {
    for (var countryEntity in _countryList) {
      print(_countryList.indexOf(countryEntity));
      _countryDropDownList.add(DropdownMenuItem<String>(
        child: Text(countryEntity.name),
        value: "${_countryList.indexOf(countryEntity)}",
      ));
    }
  }

  List<CountryEntity> get countryList => _countryList;
  List<DropdownMenuItem<String>> get countryDropDownList =>
      _countryDropDownList;

  set countryList(List<CountryEntity> value) {
    _countryList = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  CountryEntity get selectedCountry => _selectedCountry;

  set selectedCountry(CountryEntity value) {
    _selectedCountry = value;
  }
}
