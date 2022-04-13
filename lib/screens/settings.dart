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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      //print("gfgdgdfg");
                      //Get.to(EditProfileScreen());
                    },
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('images/sundar.png'),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [Text('sundar'), Text('9876543210')],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 150,
                  ),
                
                  TextButton(
                    onPressed: () {
                      Get.to(EditProfileScreen());
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.orange[600],
                    ),
                    child: Text(
                      'Edit',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),                  
                ],
              ),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  SizedBox(width: 25,),
                                    Icon(Icons.post_add),
                                                      SizedBox(width: 15,),

                                   // Text('My Ads'),
                                    TextButton(
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
                                   
                ],
              ),
              Row(
                 children: [
                  SizedBox(
                    height: 55,
                  ),
                  SizedBox(width: 25,),
                                    Icon(Icons.person_outline_outlined),
                                                      SizedBox(width: 15,),

                                    Text('About us'),
                 ]
              ),
              Row(
                 children: [
                  SizedBox(
                    height: 55,
                  ),
                  SizedBox(width: 25,),
                                    Icon(Icons.contacts_outlined),
                                                      SizedBox(width: 15,),

                                    Text('Contact us'),
                 ]
              )


            ],
          ),
        ),
      ),
    );
  }
}
