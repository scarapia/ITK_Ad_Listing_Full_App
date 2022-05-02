import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  final box = GetStorage();
  String _imageURL = "";
  //var userImage = [];

  updateProfile() async {
    var token = box.read('token');
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

  readUserData() async {
    var token = box.read('token');
    var resp = await http.post(
      Uri.parse(Constants().apiURL + '/user/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var tmp = json.decode(resp.body);
    print(tmp);
    if (tmp['status'] == true) {
      _nameCtrl.text = tmp['data']['name'];
      _emailCtrl.text = tmp['data']['email'];
      _mobileCtrl.text = tmp['data']['mobile'];
    }
  }

  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
      setState(() {
        _imageURL = image.path;
      });
    } else {
      print("No image picked");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                pickImage();
              },
              child: CircleAvatar(
                radius: 55,
                backgroundImage: ExactAssetImage('images/sundar.png'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Current Name"),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Current Email Adress"),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _mobileCtrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Current Mobile Number "),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        updateProfile();
                        Get.to(AdsListingScreen());
                      },
                      child: Text("Update Profile"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          primary: Colors.orange[900],
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      child: Text("Logout"),
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                          onPrimary: Colors.orange[900]),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
