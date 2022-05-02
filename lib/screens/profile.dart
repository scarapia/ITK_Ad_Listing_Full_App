import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';


import 'package:ad_listing_full_app/util/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjVkNjUxZWRmMDgxNGI0NzkxYmM3N2MiLCJpYXQiOjE2NTAyODk0NDJ9.6hTmMW-30YigpTKj8Dr10iRibVl5wlzEjBCH1bl-U-U";

  updateProfile() async {
    var resp = await http.patch(
      Uri.parse(Constants().apiURL + '/user/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "name": _nameCtrl.text,
        "email": _emailCtrl.text,
        "mobile": _mobileCtrl.text,
        "imgURL": "http://site.com/image.png"
      }),
    );
    print(json.decode(resp.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: _nameCtrl,
            ),
            TextField(
              controller: _emailCtrl,
            ),
            TextField(
              controller: _mobileCtrl,
            ),
            TextButton(
              onPressed: () {
                updateProfile();
              },
              child: Text("Update Profile"),
            )
          ],
        ));
  }
}