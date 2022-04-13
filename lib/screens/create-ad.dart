import 'package:ad_listing_full_app/screens/ads-listing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAdScreen extends StatefulWidget {
  CreateAdScreen({Key? key}) : super(key: key);

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create Ad"),
          ],
        ),
      ),
      body: Center(
        child: Column(children: [
          Container(
            height: 200,
            width: 200,
            //radius: 55,
            //backgroundColor: Colors.brown.shade800,
            child: Stack(
              children: [
                Center(
                  child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.white,
                      child: OutlinedButton(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.grey,
                          ),
                          onPressed: () {})
                          ),
                ),
                SizedBox(width: 20,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Tap to upload'),
                ),
                //Text('tap'),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Title"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Price"),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Contact Number "),
          ),
          SizedBox(height: 20),
          Container(
            width: 400,

            //height: 200,
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description "),
                style: TextStyle(height: 4.0)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(AdsListingScreen());
            },
            child: Text("Submit Ad"),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 50),
                primary: Colors.orange[600],
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }
}
