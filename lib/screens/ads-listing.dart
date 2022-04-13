import 'package:ad_listing_full_app/screens/contact-seller.dart';
import 'package:ad_listing_full_app/screens/create-ad.dart';
import 'package:ad_listing_full_app/screens/edit-profile.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:ad_listing_full_app/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsListingScreen extends StatefulWidget {
  AdsListingScreen({Key? key}) : super(key: key);

  @override
  State<AdsListingScreen> createState() => _AdsListingScreenState();
}

class _AdsListingScreenState extends State<AdsListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Ads Listing"),
            GestureDetector(
              onTap: () {
                //print("gfgdgdfg");
                Get.to(SettingsScreen());
              },
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('images/sundar.png'),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 720,
              width: 400,
              color: Colors.white,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/mobile_2.jpeg',
                          fit: BoxFit.cover,
                        ),
                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Samsung For Sale",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "12000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/mobile_1.jpeg',
                          fit: BoxFit.cover,
                        ),
                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Iphone For Sale",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "33000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/car_2.jpeg',
                          fit: BoxFit.cover,
                        ),
                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Maruti For Sale",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "300000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/hourse_1.jpg',
                          fit: BoxFit.cover,
                        ),
                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Farm Land near Chennai",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "1200000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/car_1.jpeg',
                          fit: BoxFit.cover,
                        ),
                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Used Benz for Sale",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "1200000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //print("gfgdgdfg");
                            Get.to(ContactSellerScree());
                          },
                          child: Image.asset(
                            'images/apple-macbook-pro-m1.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),

                        //Container(

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: 70,
                            width: 200,
                            color: const Color(0xFF0E3311).withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Used Macbook for Sale",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "12000.0",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(CreateAdScreen());
                },
                child: Icon(Icons.add_a_photo),
                backgroundColor: Colors.orange[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
