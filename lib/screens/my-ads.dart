import 'dart:convert';

import 'package:ad_listing_full_app/controllers/auth-controller.dart';
import 'package:ad_listing_full_app/controllers/profile-controller.dart';
import 'package:ad_listing_full_app/custom-widgets/my-ads-widget.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  var userObj = {};
  bool isLoading = true;
  var adsObj;
  final ProfileController _profileCtrl = Get.put(ProfileController());
  final AuthController _authCtrl = AuthController();
  var adsCollection =
      FirebaseFirestore.instance.collection('ads').where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  getAdsData() async{
    QuerySnapshot querySnapshotAds = await adsCollection.get();
    setState(() {
      adsObj = querySnapshotAds.docs.map((doc) => doc.data()).toList();
    });
  }

  Future getAdsLoadingController() async {
    var resp = await getAdsData();
    if (resp != "Error") {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
      });
    }
  }

  @override
  void initState() {
    getAdsLoadingController();
    super.initState();
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Ads"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: adsObj.length,
        itemBuilder: (BuildContext context, int index) {
          return MyAds(objApi: adsObj[index]);
        },
      ),
    );
  }
}