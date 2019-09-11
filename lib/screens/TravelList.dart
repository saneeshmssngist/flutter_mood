import 'package:flutter/material.dart';
import 'package:mood/Network.dart';
import 'package:mood/Transitions.dart';
import 'package:mood/models/Name.dart';
import 'package:mood/screens/DetailsPage.dart';
import 'package:mood/screens/ViewAllData.dart';
import 'package:mood/screens/ViewAllScreens.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TravelListData();
  }
}

class TravelListData extends State<MainScreen> {
  int count = 0;
  List<TravelPlaces> placesNear = [];
  List<TravelPlaces> placesMost = [];
  List<TravelPlaces> placesTopRated = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
        Container(
        margin: EdgeInsets.only(left: 10,top: 40,right: 20,bottom: 20),
        color: Colors.white,
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Traveller",
                style: TextStyle(
                fontSize: 26.0,
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                )),
            Container(
              height: 7,
            ),
            Text("Where you want to go ?", style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300)),
          ],
        ),),
      Container(
        margin: EdgeInsets.only(
            left: 10),
        alignment
            : Alignment.centerLeft,
        color: Colors.white
        ,
        child: Container(
            alignment: Alignment.centerLeft
            ,
            color: Colors.white,
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <
                Widget>[
                Text(
                "Near you",
                textAlign
                    : TextAlign.left,
                style: TextStyle(
                    fontSize
                        : 17.0,
                    color: Colors.black38,
                    fontWeight
                        : FontWeight.w400,
                    fontStyle: FontStyle.normal
                )
            ),
            GestureDetector(
                onTap: () =>
                {
                Navigator.push(
                context,
                ScaleRoute(page: ViewAllData(id: "1", title: "Near you")))
            }
            ,
            child: IconButton(icon: Icon(Icons
                .keyboard_arrow_right, color: Colors.red))
        )
        ],
      ),
    )),
    FutureBuilder(
    future: getNearPlaces(),
    builder
        : (BuildContext
    context, AsyncSnapshot snapshot)
    {
    if (snapshot.data == null) {
    return Container(
    height: 170,
    child: Center(child: CircularProgressIndicator()),
    );
    } else {
    placesNear = snapshot.data;
    return Container(
    margin: EdgeInsets.only(bottom: 5),
    height: 170,
    color: Colors.white,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data.length,
    itemBuilder: _travelBuildTopItems,
    ));
    }
    }
    ,
    ),
    Container(
    color: Colors.black12
    ,
    height: 5,
    ),
    Container(
    margin
        : EdgeInsets.only(left: 10, top
        : 5),
    alignment: Alignment.centerLeft,
    color: Colors.white,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget
    >[
    Text(
    "Most Search",
    textAlign:
    TextAlign
        .
    left
    ,
    style
        :
    TextStyle
    (
    fontSize
        :
    17.0,
    color: Colors.black38,
    fontWeight:
    FontWeight.w400,
    fontStyle: FontStyle.normal)
    ),
    GestureDetector(
    onTap: () =>
    {
    Navigator.push(
    context, ScaleRoute(page: ViewAllData(id : "2", title : "Most Search")))
    }
    ,
    child: IconButton(icon:Icon(Icons
        .keyboard_arrow_right, color: Colors.red))
    )
    ],
    ),
    ), FutureBuilder(
    future
        : getMostSearchData(),
    builder:
    (BuildContext context
    , AsyncSnapshot snapshot)
    {
    if (snapshot.data == null) {
    return Container(
    height: 170,
    color: Colors.white,
    child: Center(child: CircularProgressIndicator()),
    );
    } else {
    placesMost = snapshot.data;
    return Container(
    height: 170,
    color: Colors.white,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data.length,
    itemBuilder: _buildMostSearchItems));
    }
    }
    ,
    ),
    Container(
    color: Colors.black12
    ,
    height: 5,
    ),
    Container(
    margin
        : EdgeInsets.only(left: 10, top
        : 5),
    alignment:
    Alignment.centerLeft,
    child: Container(
    alignment: Alignment.centerLeft,
    color: Colors.white,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget
    >[
    Text(
    "Top Rated",
    textAlign:
    TextAlign.left,
    style: TextStyle(
    fontSize:
    17.0,
    color: Colors.black38,
    fontWeight:
    FontWeight
        .
    w400
    ,
    fontStyle
        :
    FontStyle
        .
    normal
    )
    )
    ,
    GestureDetector
    (
    onTap
        :
    (
    )
    =>
    {
    Navigator.push(
    context, ScaleRoute(page:
    ViewAllScreens()))
    }
    ,
    child
        :
    IconButton
    (
    icon
        :
    Icon
    (
    Icons
        .
    keyboard_arrow_right
    ,
    color
        :
    Colors
        .
    red
    )
    )
    )
    ]
    ,
    )
    ,
    )
    ,
    )
    ,
    FutureBuilder
    (
    future
        :
    getTopRatedData
    (
    )
    ,
    builder
        :
    (
    BuildContext
    context
    ,
    AsyncSnapshot
    snapshot
    )
    {
    if (snapshot.data == null)
    {
    return Container(
    child: Center(
    child: Center(child: CircularProgressIndicator()),
    ),
    );
    }
    else
    {
    placesTopRated = snapshot.data;
    return Container(
    height: 140,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data.length,
    itemBuilder: _buildTraveltem));
    }
    }
    ,
    )
    ,
    ]
    ,
    )
    );
  }

  Widget _buildTraveltem(BuildContext context, int index) {
    return Container(
        width: 200,
        height: 120,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new NetworkImage(placesTopRated[index].img_url),
                fit: BoxFit.cover,
                alignment: Alignment.center),
            borderRadius: BorderRadius.circular(7)),
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 50.0,
          color: Colors.black26,
          margin: EdgeInsets.only(bottom: 20.0),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: <Widget>[
//          ClipRRect(
//            borderRadius: new BorderRadius.circular(10),
//            child: Image.network(nameList[index].url,
//                fit: BoxFit.fill,
//                width: 230,
//                height: 180,
//                alignment: Alignment.center),
//          ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  placesTopRated[index].name,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: 'HomeStyle',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  placesTopRated[index].name,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: 'HomeStyle',
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _travelBuildTopItems(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => {
        Navigator.push(context,
        ScaleRoute(page: DetailsPage(id: placesNear[index].id,
            imageUrl: placesNear[index].img_url,
            description: placesNear[index].description)))
  },child: Container(
    width: 120,
    height:
    170,
    alignment: Alignment.bottomCenter,
    margin:
    EdgeInsets.all(10.0),
    decoration: BoxDecoration
    (
    image: DecorationImage(
    image: NetworkImage(placesNear
    [index].img_url),
    alignment: Alignment
        .center,
    fit: BoxFit.cover),
    borderRadius: BorderRadius.circular(5),
    )
    ,
    child: new Stack(
    children: <Widget
    >[
    Positioned(
    child: Align(
    child:
    Icon(Icons.add),
    alignment: Alignment
        .topRight,
    )),
    Positioned(
    child:
    Align(
    alignment: Alignment.bottomCenter,
    child:
    Container(
    width: 120,
    padding: EdgeInsets.
    only(
    left: 3.0, top: 3.0,
    right: 3.0, bottom: 3.0),
    child
        : Text(
    placesNear[index].name,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'HomeStyle'
    )
    ,
    )
    ,
    decoration
        :
    BoxDecoration
    (
    color
        :
    Colors
        .
    black38
    ,
    borderRadius
        :
    BorderRadius
        .
    only
    (
    bottomLeft
        :
    Radius
        .
    circular
    (
    5.0
    )
    ,
    bottomRight
        :
    Radius
        .
    circular
    (
    5.0
    )
    )
    )
    ,
    )
    )
    )
    ]
    ,
    )
    )
    );
  }

  Widget _buildMostSearchItems(BuildContext context, int index) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 120,
              margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new NetworkImage(placesMost[index].img_url),
                      fit: BoxFit.fill,
                      alignment: Alignment.center),
                  borderRadius: BorderRadius.circular(7)),
              alignment: Alignment.bottomLeft,
            ),
            Container(
                height: 20.0,
                width: 200,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 5, bottom: 5),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    placesMost[index].name,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black45,
                      fontFamily: 'HomeStyle',
                    ),
                  ),
                ))
          ],
        ));
  }
}
