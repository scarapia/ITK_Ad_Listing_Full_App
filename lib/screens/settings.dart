import 'package:ad_listing_full_app/screens/edit-profile.dart';
import 'package:ad_listing_full_app/screens/my-ads.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _name = "";
  String _mobile = "";
  var _profileImage = "";
  final box = GetStorage();

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

    if (tmp['status'] == true) {
      _name = tmp['data']['name'];
      _mobile = tmp['data']['mobile'];
      _profileImage = tmp['data']['imgURL'];
      setState(() {});
    }
  }

  openURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    } else {}
  }

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_profileImage),
              ),
              title: Text(_name),
              subtitle: Text(_mobile),
              trailing: TextButton(
                onPressed: () {
                  Get.to(EditProfileScreen());
                },
                style: TextButton.styleFrom(
                  primary: Colors.orange[900],
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.post_add),
              title: TextButton(
                onPressed: () {
                  Get.to(MyAdsScreen());
                },
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: Text(
                  'My Ads',
                  // style:
                  //   TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline_outlined),
              title: TextButton(
                onPressed: () {
                  openURL("https://pub.dev/");
                  // Get.to(MyAdsScreen());
                },
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: Text(
                  'About us',
                  // style:
                  //   TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.contacts_outlined),
              title: TextButton(
                onPressed: () {
                  openURL("tel:" + _mobile);
                  //Get.to(MyAdsScreen());
                },
                style: TextButton.styleFrom(
                  primary: Colors.black87,
                ),
                child: Text(
                  'Contact us',
                  // style:
                  //   TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
