import 'package:ad_listing_full_app/controllers/auth-controller.dart';
import 'package:ad_listing_full_app/controllers/profile-controller.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';

class ProfileScreen2Firebase extends StatefulWidget {
  ProfileScreen2Firebase({Key? key}) : super(key: key);

  @override
  State<ProfileScreen2Firebase> createState() => _ProfileScreen2FirebaseState();
}

class _ProfileScreen2FirebaseState extends State<ProfileScreen2Firebase> {
  var userObj = {};
  var _imageURL = "https://picsum.photos/200/300";
  ProfileController _profileCtrl = Get.put(ProfileController());
  AuthController _authCtrl = AuthController();
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  getUserData() {
    FirebaseFirestore.instance
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((res) {
      setState(
        () {
          userObj = {"id": res.id, ...res.data()!};
          _nameCtrl.text = userObj['displayName'];
          _emailCtrl.text = userObj['email'];
          _mobileCtrl.text = userObj['mobile'];
          _imageURL = userObj['imageURL'];
        },
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  uploadImage() async {
    var filePath = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (filePath!.path.length != 0) {
      File file = File(filePath.path);
      var storageRef = await FirebaseStorage.instance
          .ref()
          .child("uploads")
          .child(getRandomString(12))
          .putFile(file);

      var uploadedURL = await storageRef.ref.getDownloadURL();
      setState(() {
        _imageURL = uploadedURL;
      });
      _profileCtrl.updateProfile({"imageURL": _imageURL});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              uploadImage();
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(_imageURL),
              radius: 40,
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
              _profileCtrl.updateProfile({
                "displayName": _nameCtrl.text,
                "mobile": _mobileCtrl.text,
                "email": _emailCtrl.text
              });
            },
            child: Text("update profile"),
          ),
          TextButton(
            onPressed: () {
              _authCtrl.logout();
            },
            child: Text("logout"),
          ),
        ],
      ),
    );
  }
}