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
        title:  Text("Edit Ad"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                        height: 100,
                        width: 120,
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
                                onPressed: () {}),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Tap to upload'),
                          ],
                        )),
                  ),

                  // Text('Tap to upload'),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/apple-macbook-pro-m1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/apple-macbook-pro-m1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/apple-macbook-pro-m1.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                        border: OutlineInputBorder(),
                        hintText: "Contact Number "),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,

                    //height: 200,
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Description "),
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
                        primary: Colors.orange[900],
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
