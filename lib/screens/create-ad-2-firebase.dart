import 'package:ad_listing_full_app/controllers/ads-controllers.dart';
import 'package:ad_listing_full_app/controllers/profile-controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class CreateAdScreen2Firebase extends StatefulWidget {
  CreateAdScreen2Firebase({Key? key}) : super(key: key);

  @override
  State<CreateAdScreen2Firebase> createState() =>
      _CreateAdScreen2FirebaseState();
}

class _CreateAdScreen2FirebaseState extends State<CreateAdScreen2Firebase> {
  final ProfileController _profileCtrl = Get.put(ProfileController());

  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  final AdsController _todoController = Get.put(AdsController());
  var _imageAd = "";
  var userObj;
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  var _userName;

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
      print(uploadedURL);
      setState(() {
        _imageAd = uploadedURL;
      });
    }
  }

  createAd() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection("ads").doc(getRandomString(12)).set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "title": _titleCtrl.text,
      "description": _descriptionCtrl.text,
      "mobile": _mobileCtrl.text,
      "price": _priceCtrl.text,
      "images": _imageAd,
      "authorName": _userName,
      "createdAt": FieldValue.serverTimestamp(),
    });
    //Get.offAll(const HomeScreen());
  }

  getUserData() {
    FirebaseFirestore.instance
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((res) {
      setState(
        () {
          userObj = {"id": res.id, ...res.data()!};
          _userName = userObj['displayName'];
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Ad"),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                          height: 120,
                          width: 150,
                          //color: Colors.white,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 0.0, color: Colors.white),
                                  ),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    //pickMulipeImage();
                                    uploadImage();
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              Text('Tap to upload'),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 20,
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
                        controller: _titleCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _priceCtrl,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Price',
                        ),
                        keyboardType:
                            TextInputType.number, //Numbers-Only-Keyboard
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        obscureText: false,
                        controller: _mobileCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Number',
                        ),
                        keyboardType:
                            TextInputType.number, //Numbers-Only-Keyboard
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                          controller: _descriptionCtrl,
                          // obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                          style: TextStyle(height: 4.0)),
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
                            // _todoController.addTask(_titleCtrl.text,_priceCtrl.text,_mobileCtrl.text,_descriptionCtrl.text);
                            createAd();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Submit Ad",
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
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
