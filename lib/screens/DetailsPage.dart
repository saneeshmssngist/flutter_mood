import 'package:flutter/material.dart';
import 'package:mood/models/Name.dart';

class DetailsPage extends StatelessWidget {
  String id;
  String description;
  String imageUrl;

  DetailsPage({Key key, @required this.id, this.imageUrl, this.description});

  int count = 0;
  List<TravelPlaces> nameList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                          alignment: Alignment.center),
                      borderRadius: BorderRadius.circular(2.0)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 15, top: 10.0, right: 15, bottom: 15),
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
