import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mood/models/Name.dart';

Future<List<TravelPlaces>> getNearPlaces() async {
  var data =
      await http.get("http://192.168.1.7/travel_api/get_near_places.php");
  return getParseData(data);
}

Future<List<TravelPlaces>> getMostSearchData() async {
  var data =
      await http.get("http://192.168.1.7/travel_api/get_most_search_data.php");
  return getParseData(data);
}

Future<List<TravelPlaces>> getTopRatedData() async {
  var data =
      await http.get("http://192.168.1.7/travel_api/get_top_rated_data.php");
  return getParseData(data);
}

Future<List<TravelPlaces>> getSearchData(String text) async {

  String url = "http://192.168.1.7/travel_api/get_explore_search_data.php";
  Map<String,String> jsonbody = {"search_string": text};

  http.Response response = await http.post(url, body: jsonbody);
  return getParseData(response);
}

List<TravelPlaces> getParseData(var data) {
  var jsonData = json.decode(data.body);

  List<TravelPlaces> nameList = [];

  var searchDat = jsonData["most_search_data"];
  for (var objct in searchDat) {
    TravelPlaces name = TravelPlaces(objct["id"], objct["name"],
        objct["description"], "https://docs.google.com/uc?" + objct["img_url"]);
    nameList.add(name);
  }
  return nameList;
}
