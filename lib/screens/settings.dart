import 'package:ad_listing_full_app/screens/edit-profile.dart';
import 'package:ad_listing_full_app/screens/my-ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            backgroundImage: ExactAssetImage('images/sundar.png'),
              ),
              title: Text('sundar'),
              subtitle: Text('9876543210'),
              trailing: TextButton(
            onPressed: () {
              Get.to(EditProfileScreen());
            },
            style: TextButton.styleFrom(
              primary: Colors.orange[900],
            ),
            child: Text(
              'Edit',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold),
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
