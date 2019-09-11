import 'package:flutter/material.dart';
import 'package:mood/screens/SearchScreen.dart';
import 'package:mood/screens/TravelList.dart';
import 'package:mood/screens/ViewAllScreens.dart';

void main() {
  runApp(MYTravel());
}

class MYTravel extends StatelessWidget {
  MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Travel",
        theme: ThemeData(
//            primarySwatch: Colors.white,
            textTheme: TextTheme(title: TextStyle(color: Colors.black)),
            primaryColor: Colors.white),
//        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<HomeScreen> {
  String stateFlag = "1";

  MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens(),
      floatingActionButton: FloatingActionButton(
          child: IconButton(
            icon: Icon(Icons.location_searching),
            color: Colors.white,
          ),
          mini: true,
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        this.index = index;
        setState(() {});

        if (index == 0) {
          stateFlag = "1";
        } else if (index == 1) {
          stateFlag = "2";
        } else if (index == 2) {
          stateFlag = "3";
        }
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: index == 0
                ? Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 20,
                  )
                : Icon(
                    Icons.home,
                    color: Colors.black45,
                    size: 20,
                  ),
            title: index == 0
                ? Text(
                    "Home",
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  )
                : Text(
                    "Home",
                    style: TextStyle(color: Colors.black45, fontSize: 12.0),
                  )),
        BottomNavigationBarItem(
            icon: index == 1
                ? Icon(
                    Icons.explore,
                    color: Colors.black,
                    size: 20,
                  )
                : Icon(
                    Icons.explore,
                    color: Colors.black45,
                    size: 20,
                  ),
            title: index == 1
                ? Text(
                    "Explore",
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  )
                : Text(
                    "Explore",
                    style: TextStyle(color: Colors.black45, fontSize: 12.0),
                  )),
        BottomNavigationBarItem(
            icon: index == 2
                ? Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 20,
                  )
                : Icon(
                    Icons.favorite,
                    color: Colors.black45,
                    size: 20,
                  ),
            title: index == 2
                ? Text(
                    "Favourite",
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  )
                : Text(
                    "Favourite",
                    style: TextStyle(color: Colors.black45, fontSize: 12.0),
                  ))
      ],
    );
  }

  Widget _buildScreens() {
    switch (stateFlag) {
      case "1":
        return SingleChildScrollView(child:MainScreen());
      case "2":
        return SearchData();
      case "3":
        return ViewAllScreens();
    }
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
