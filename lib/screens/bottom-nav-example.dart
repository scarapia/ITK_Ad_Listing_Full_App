import 'package:ad_listing_full_app/home.dart';
import 'package:ad_listing_full_app/screens/about.dart';
import 'package:ad_listing_full_app/screens/contact.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:flutter/material.dart';

class BottomNavExample extends StatefulWidget {
  BottomNavExample({Key? key}) : super(key: key);

  @override
  State<BottomNavExample> createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
var _pages = [
    LoginScreen(),
    HomeScreen(),
    AboutScreen(),
    ContactScreen(),
  ];
  var _currentIndex = 0; //Index = start screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
