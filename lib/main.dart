import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:ad_listing_full_app/home.dart';
import 'package:ad_listing_full_app/screens/bottom-nav-example.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     // home: BottomNavExample(),
     home: LoginScreen(),
    );
  }
}
