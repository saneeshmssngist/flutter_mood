import 'package:flutter/material.dart';
import 'package:mood/Network.dart';
import 'package:mood/models/Name.dart';

class ViewAllData extends StatefulWidget {

  String id;
  String title;

  ViewAllData({Key key, @required this.id,this.title});

  @override
  State<StatefulWidget> createState() {
    return ViewData();
  }
}

class ViewData extends State<ViewAllData> {
  List<TravelPlaces> imagedata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: FutureBuilder(
            future: getTopData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                // ignore: missing_return, missing_return
                return Center(child: CircularProgressIndicator());
              } else {
                imagedata = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10),
                    itemBuilder: _viewAllItem,
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                  ),
                );
              }
            }));
  }

  Widget _viewAllItem(BuildContext context, int index) {
    return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 150,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(imagedata[index].img_url),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5.0,
                    ),
                  ]),
            ),
            Text(
              imagedata[index].name,
              style: TextStyle(
                fontSize: 13.0,
                color: Colors.black45,
                fontFamily: 'HomeStyle',
              ),
            )
          ],
        )
    );
  }

  Future<List<TravelPlaces>> getTopData() {
    if (widget.id == "1") {
      return getNearPlaces();
    }
    else {
      return getMostSearchData();
    }
  }
}
