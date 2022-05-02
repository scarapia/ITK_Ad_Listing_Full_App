import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ad_listing_full_app/util/constants.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  String _imageURL = "";
  final box = GetStorage();

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

  readUserData() async{
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
    if(tmp['status'] == true){
      _nameCtrl.text = tmp['data']['name'];
      _emailCtrl.text = tmp['data']['email'];
      _mobileCtrl.text = tmp['data']['mobile'];
    }
  }

  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      print(image.path);
      setState(() {
        _imageURL = image.path;
      });
    } else {
      print("No image picked");
    }
  }

  // writeToken() {
  //   box.write('token', 'abcd');
  // }

  // readToken() {
  //   var token = box.read('token');
  //   print(token);
  // }

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
          actions: [
            // IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () {
            //       writeToken();
            //     }),
            // IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () {
            //       readToken();
            //     })
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                pickImage();
              },
              child: Container(
                child: _imageURL != ""
                    ? Image.file(File(_imageURL), height: 100, width: 100)
                    : Image.asset("assets/images/food.png",
                        height: 100, width: 100),
              ),
            ),
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