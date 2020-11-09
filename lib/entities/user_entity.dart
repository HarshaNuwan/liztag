import 'package:flutter/foundation.dart';


class UserEntity with ChangeNotifier, DiagnosticableTreeMixin{
  int _userId;
  int _countryId;
  String _name;
  String _phoneNumber;
  String _email;
  bool _status;

  UserEntity.fromJson(Map<String, dynamic> parsedJson){
    _userId = parsedJson['userId'];
    _countryId = parsedJson['countryId'];
    _name = parsedJson['name'];
    _phoneNumber = parsedJson['phoneNumber'];
    _email = parsedJson['email'];
    _status = parsedJson['status'];
  }

  UserEntity(int userId, int countryId, String name, String phoneNumber, String email, bool status){
    _userId = userId;
    _countryId = countryId;
    _name = name;
    _phoneNumber = phoneNumber;
    _email = email;
    _status = status;
  }

  int get userId => _userId;
  String get name => _name;
  int get country => _countryId;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  bool get status => _status;

}