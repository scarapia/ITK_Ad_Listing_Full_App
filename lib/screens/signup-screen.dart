import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Full Name"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email Adress"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Mobile number"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text("Register Now"),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 50),
                  primary: Colors.orange[600],
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
             TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.orange[600],
                    ),
                    child: Text(
                      'Already have an account?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
           
          ],
        ),
      ),
    );
  }
}
