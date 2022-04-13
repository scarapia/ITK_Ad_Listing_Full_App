import 'package:ad_listing_full_app/screens/my-ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAdScreen extends StatefulWidget {
  EditAdScreen({Key? key}) : super(key: key);

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Edit Ad"),
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
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width:  60,
                        height: 60,
                        child: Image.asset(
                          'images/apple-macbook-pro-m1.jpeg',
                          fit: BoxFit.cover,
                        ) ,
                      ),
                      Container(
                        width:  60,
                        height: 60,
                        child: Image.asset(
                          'images/apple-macbook-pro-m1.jpeg',
                          fit: BoxFit.cover,
                        ) ,
                      ),
                      Container(
                        width:  60,
                        height: 60,
                        child: Image.asset(
                          'images/apple-macbook-pro-m1.jpeg',
                          fit: BoxFit.cover,
                        ) ,
                      )
                    ],
                  ),
                  // Text('Tap to upload'),
                ),

               
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
              Get.to(MyAdsScreen());
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