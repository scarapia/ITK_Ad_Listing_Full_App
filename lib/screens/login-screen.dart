import 'package:ad_listing_full_app/home.dart';
import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/signup-screen.dart';
import 'package:ad_listing_full_app/services/auth.dart';
import 'package:ad_listing_full_app/util/constants.dart';
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
  TextEditingController _emailCtrl =
      TextEditingController(text: "sergio@sergio.com");
  TextEditingController _passwordCtrl = TextEditingController(text: "123456");
  final box = GetStorage();

  Auth _auth = Get.put(Auth()); //_auth private

  login() async {
    //print(_emailCtrl.text);
    //print(_passwordCtrl.text);
    var res = await http.post(
      Uri.parse(Constants().apiURL + "/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": _emailCtrl.text,
        "password": _passwordCtrl.text,
      }),
    );
    //print(json.decode(res.body));
    var resp = json.decode(res.body);
     if (resp["status"] == true) {
     // print(resp["data"]["token"]);
      box.write('token', resp["data"]["token"]);
       box.write('imgURL', resp["data"]["user"]["imgURL"]);
      box.write('mobile', resp["data"]["user"]["mobile"]);

      
      //Get.offAll( LoginScreen());
    }
    
    
    //print(resp);
    _auth.token.value = resp["data"]["token"];
    Get.offAll(AdsListingScreen()); // go to adslisting
    //print(resp["data"]["token"]);
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
