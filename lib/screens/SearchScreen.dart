import 'package:flutter/material.dart';
import 'package:mood/Network.dart';
import 'package:mood/Transitions.dart';
import 'package:mood/models/Name.dart';
import 'package:mood/screens/DetailsPage.dart';

class SearchData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Search();
  }
}

class Search extends State<SearchData> {
  List<TravelPlaces> nameList;

  TextEditingController _controller = new TextEditingController();
  FocusNode _textFocus = new FocusNode();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(onChange);
    _controller.text = "";
  }

  void onChange() {
    print("");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 10, top: 40, right: 20, bottom: 10),
            color: Colors.white,
            child: Text("Explore",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Container(
              padding: EdgeInsets.only(left: 15),
              height: 40,
              margin: EdgeInsets.only(left: 10, top: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12),
              child: TextField(
                textAlign: TextAlign.start,
                controller: _controller,
                focusNode: _textFocus,
                style: TextStyle(
                    fontFamily: 'SearchTextStyle',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.black12,
//                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),borderSide: BorderSide()),
                    hintText: "Search Places..",
                    hintStyle: TextStyle(
                        fontFamily: 'SearchTextStyle',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45)),
                textInputAction: TextInputAction.search,
              )),
          _searchData()
        ],
      ),
    );
  }

  Widget _searchData() {
    return FutureBuilder(
      future: getSearchData(_controller.text),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: CircularProgressIndicator(),
          );
        } else {
          nameList = snapshot.data;
          return Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: _searchListItem),
            ),
          );
        }
      },
    );
  }

  Widget _searchListItem(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  ScaleRoute(
                      page: DetailsPage(
                          id: nameList[index].id,
                          imageUrl: nameList[index].img_url,
                          description: nameList[index].description)))
            },
        child: Container(
            height: 70,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 8, bottom: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            child: Row(
              children: <Widget>[
                Container(
                  height: 65,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(nameList[index].img_url),
                          alignment: Alignment.center,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      nameList[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45, fontSize: 13),
                    ))
              ],
            )));
  }
}
