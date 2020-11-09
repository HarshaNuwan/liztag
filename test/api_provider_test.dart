import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:liztag/entities/item_model.dart';
import 'package:liztag/services/api_provider.dart';
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test("Testing network call", () async{
    final apiProvider = ApiProvider();
    apiProvider.client = MockClient((request) async {
      final mapJson = {'id': 123};
      return Response(json.encode(mapJson), 200);
    });

    ItemModel im = apiProvider.fetchPosts();
    print(im);

    final item = await apiProvider.fetchPosts();
    expect(item.id, 123);
  });

  test("Test fetching advertisements by geo codes", () async{
    final apiProvider = ApiProvider();
    await apiProvider.fetchUser();
    //await apiProvider.fetchAdvertisementsByGeoCodes(23.2323232, 45.342323);
  });
}
