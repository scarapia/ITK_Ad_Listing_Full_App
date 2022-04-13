import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Edit Profile"),
          ],
        ),
                backgroundColor: Colors.black,

      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: ExactAssetImage('images/sundar.png'),
            ),
             SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Current Name"),
            ),
             SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Current Email Adress"),
            ),
             SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Current Mobile Number "),
            ),
             ElevatedButton(
              onPressed: () {
                Get.to(AdsListingScreen());
              },
              child: Text("Update Profile"),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 50),
                  primary: Colors.orange[600],
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () {
                Get.to(LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold), onPrimary: Colors.orange[600]),
            ),
          ],
        ),

      ),
    );
  }
}