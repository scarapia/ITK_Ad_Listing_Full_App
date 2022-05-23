import 'package:ad_listing_full_app/home.dart';
import 'package:ad_listing_full_app/screens/add-task.dart';
import 'package:ad_listing_full_app/screens/ads-lisiting-2-firebase.dart';
import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/create-ad-2-firebase.dart';
import 'package:ad_listing_full_app/screens/edit-profile.dart';
import 'package:ad_listing_full_app/screens/home-validation.dart';
import 'package:ad_listing_full_app/screens/profile-2-firebase.dart';
import 'package:ad_listing_full_app/screens/settings.dart';
import 'package:ad_listing_full_app/screens/signup-screen.dart';
import 'package:ad_listing_full_app/services/auth.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

TextEditingController _emailCtrl = TextEditingController(text: "scfactor@hotmail.com");
  TextEditingController _passwordCtrl = TextEditingController(text: "123456");

  login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailCtrl.text,
      password: _passwordCtrl.text,
    )
        .then((res) {
          print(res);
      print("Login Success");
      Get.to(AdsListingsScreen2Firebase());
    }).catchError((e) {
      print(e);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                  //Image.asset('images/logo.png'),
                ),
              ]),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email Adress"),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Get.to(AdsListingScreen()); // Go to ad-listings-2.dart
                        login();
                      },
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          primary: Colors.orange[900],
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.orange[900],
                      ),
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
