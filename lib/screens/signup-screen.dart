import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();

  register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailCtrl.text,
      password: _passwordCtrl.text,
    )
        .then((value) {
      print("Login Success");
      insertToFirestore();
      // Get.to(HomeScreen());
      Get.offAll( LoginScreen());
    }).catchError((e) {
      print(e);
    });
  }

  insertToFirestore() {
    // FirebaseFirestore.instance.collection("accounts").add({
    //   "uid": FirebaseAuth.instance.currentUser!.uid,
    //   "displayName": _nameCtrl.text,
    //   "email": _emailCtrl.text,
    //   "mobile": _mobileCtrl.text,
    //   "createdAt": FieldValue.serverTimestamp()
    // });
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("accounts").doc(uid).set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "displayName": _nameCtrl.text,
      "email": _emailCtrl.text,
      "mobile": _mobileCtrl.text,
      "createdAt": FieldValue.serverTimestamp()
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Image.asset(
                        "images/background.png",
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      width: 240,
                      height: 160,
                      child: Image.asset("images/logo.png"),
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _emailCtrl,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Adress',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        obscureText: false,
                        controller: _mobileCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                        ),
                        keyboardType:
                            TextInputType.number, //Nu
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 360,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange[900],
                          ),
                          onPressed: () {
                            register();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Register Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: 360,
                        height: 60,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.orange[900],
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         LoginScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}