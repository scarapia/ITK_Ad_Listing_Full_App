import 'package:ad_listing_full_app/controllers/auth-controller.dart';
import 'package:ad_listing_full_app/controllers/profile-controller.dart';
import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Profile"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    //pickImage();
                    uploadImage();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      //backgroundColor: Colors.black,
                      //backgroundImage: NetworkImage(_profileImage),
                      backgroundImage: NetworkImage(_imageURL),
                      radius: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _emailCtrl,
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _mobileCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile',
                ),
                keyboardType: TextInputType.number, //Numbers-Only-Keyboard
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 360,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[800],
                  ),
                  onPressed: () {
                    // updateProfile();
                    _profileCtrl.updateProfile({
                      "displayName": _nameCtrl.text,
                      "mobile": _mobileCtrl.text,
                      "email": _emailCtrl.text
                    });
                    //Navigator.push(
                    //  context,
                    //MaterialPageRoute(
                    //  builder: (context) => AdsListingScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Update Profile",
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
              SizedBox(
                width: 360,
                height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.orange[900],
                  ),
                  onPressed: () {
                    _authCtrl.logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
