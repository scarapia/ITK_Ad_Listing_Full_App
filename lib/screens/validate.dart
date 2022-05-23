import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/home-validation.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ValidateScreen extends StatefulWidget {
  const ValidateScreen({ Key? key }) : super(key: key);

  @override
  State<ValidateScreen> createState() => _ValidateScreenState();
}

class _ValidateScreenState extends State<ValidateScreen> {
  bool _isLoggedIn = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validateUser();
  }

  validateUser(){
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user != null){
        setState(() {
          _isLoggedIn = true;
        });
      }
      else{
         setState(() {
          _isLoggedIn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? HomeValidationScreen() : LoginScreen();
  }
}