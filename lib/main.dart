import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/create-ad.dart';
import 'package:ad_listing_full_app/screens/loading-indicator-example.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:ad_listing_full_app/screens/my-page.dart';
import 'package:ad_listing_full_app/screens/profile.dart';
import 'package:ad_listing_full_app/screens/settings.dart';
import 'package:ad_listing_full_app/screens/signup-screen.dart';
import 'package:ad_listing_full_app/screens/url-launcher.dart';
import 'package:ad_listing_full_app/screens/validate.dart';
import 'package:flutter/material.dart';
import 'package:ad_listing_full_app/home.dart';
import 'package:ad_listing_full_app/screens/bottom-nav-example.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     // home: BottomNavExample(),
     home:LoginScreen (),
    );
  }
}
