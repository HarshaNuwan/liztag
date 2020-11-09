import 'package:flutter/foundation.dart';


class CountryEntity with ChangeNotifier, DiagnosticableTreeMixin{
  int _countryId;
  String _name;
  String _currency;
  String _countryCode;

  CountryEntity();
  CountryEntity.withAllParams(this._countryId, this._name, this._currency, this._countryCode);

  CountryEntity.fromJson(Map<String, dynamic> parsedJson){
    _countryId = parsedJson['countryId'];
    _name = parsedJson['name'];
    _currency = parsedJson['currency'];
    _countryCode = parsedJson['countryCode'];
  }

  String get countryCode => _countryCode;

  String get currency => _currency;

  String get name => _name;

  int get countryId => _countryId;

  set countryId(int value) {
    _countryId = value;
  }


}