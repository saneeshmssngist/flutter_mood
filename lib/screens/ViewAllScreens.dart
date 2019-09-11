import 'package:flutter/material.dart';
import 'package:mood/Network.dart';
import 'package:mood/models/Name.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ViewAllScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewAll();
  }
}

class ViewAll extends State<ViewAllScreens> {
  List<TravelPlaces> imagedata;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10, top: 40, right: 20, bottom: 10),
              color: Colors.white,
              child: Text("Favourite",
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            FutureBuilder(
                future: getTopRatedData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    // ignore: missing_return, missing_return
                    return Center(child: CircularProgressIndicator());
                  } else {
                    imagedata = snapshot.data;
                    return Container(
                      child: ListView.builder(
                        itemBuilder: _viewAllItem,
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                      ),
                    );
                  }
                })
          ],
        ));
  }

  Widget _viewAllItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      height: 220.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: NetworkImage(imagedata[index].img_url),
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: Text(imagedata[index].name,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black45,
                          fontFamily: 'HomeStyle')),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: Text(imagedata[index].name),
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ),
          Align(
            child: Text(imagedata[index].name),
            alignment: Alignment.topLeft,
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SmoothStarRating(
                          starCount: 5,
                          size: 15.0,
                          color: Colors.deepOrange,
                          borderColor: Colors.deepOrange,
                          rating: 4.0,
                          onRatingChanged: (value) {
                            setState(() {});
                          })),
                  Text(" (124 Ratings)",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                          fontFamily: 'HomeStyle'))
                ],
              ))
        ],
      ),
    );
  }
}
