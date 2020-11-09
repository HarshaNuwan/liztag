import 'package:http/http.dart' show Client;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:liztag/entities/advertisement_model.dart';
import 'package:liztag/entities/item_model.dart';
import 'package:liztag/entities/user_entity.dart';

class ApiProvider {
  Client client = Client();

  fetchPosts() async {
    final response =
        await client.get("https://jsonplaceholder.typicode.com/posts/1");
    ItemModel itemModel = ItemModel.fromJson(json.decode(response.body));
    return itemModel;
  }

  fetchUser() async {
    //final response = await client.get("");// put the exact web end pont and comment bellow line
    final response = await rootBundle.loadString(
        "resources/test_user.json"); //this line load the JSON from the local and parse the user
    //UserModel userModel = UserModel.fromJson(json.decode(response));
    //print(userModel);
    return null;//userModel;
  }

  //signUp(UserModel userModel) async {
   // print(userModel.name);
  //}

  Future< List<AdvertisementModel>> fetchAdvertisementsByGeoCodes(double longitude, double latitude) async {
    final response =
        await rootBundle.loadString("resources/test_advertisements.json");

    var advertisementObjsJson = jsonDecode(response)['advertisements'] as List;
    List<AdvertisementModel> advObjects = advertisementObjsJson
        .map((advertisement) => AdvertisementModel.fromJson(advertisement))
        .toList();

    return advObjects;
  }

  updateUserFavoriteAdd(int advId){
    print(advId);
  }
}
