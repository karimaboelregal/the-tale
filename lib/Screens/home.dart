import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:thetale/Screens/actualhome.dart';
import 'package:thetale/Screens/likes.dart';
import 'package:thetale/Screens/profile.dart';
import 'package:thetale/Screens/search.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  List Pages = [Actualhome(), Search(), Likes(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.red,
              unselectedColor: Colors.white),

          /// Search
          SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.red,
              unselectedColor: Colors.white),

          /// Likes
          SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.red,
              unselectedColor: Colors.white),

          /// Profile
          SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.red,
              unselectedColor: Colors.white),
        ],
      ),
      body: Pages[_currentIndex],
    );
  }
}
