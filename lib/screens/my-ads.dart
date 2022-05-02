import 'package:ad_listing_full_app/custom-widgets/my-ads-widget.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAdsScreen extends StatefulWidget {
  MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  String _imageURL = "";
  var _ads = [];
  final box = GetStorage();
  readUserAds() async {
    var token = box.read('token');
    var resp = await http.post(
      Uri.parse(Constants().apiURL + '/ads/user'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var tmp = json.decode(resp.body);
    print(tmp);
    setState(() {
      _ads = tmp["data"];
    });
    //print(_ads[0]['images'][0]);

    
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readUserAds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Ads'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              
              child: 
              _ads.isEmpty ? Container() : ListView.builder(
                
                  itemCount: _ads.length,
                  itemBuilder: (context, index) {
                    return MyAds(
                        title: _ads[index]['title'],
                        price: _ads[index]['price'].toString(),
                        timesAgo: _ads[index]['createdAt'],
                        imageURL: _ads[index]['images'][0]);
                  }),
              /*
                child: ListView(
                  children: [
                    MyAds(
                      title: "Samsung For Sale",
                      price: 12000.0,
                      timesAgo: "8 days ago",
                      imageURL: "images/mobile_2.jpeg",
                    ),
                    
                    MyAds(
                      title: "Iphone For Sale",
                      price: 33000.0,
                      timesAgo: "18 days ago",
                      imageURL: "images/mobile_1.jpeg",
                    ),
                    MyAds(
                      title: "Used MAcbook Pro for sale",
                      price: 45000.0,
                      timesAgo: "14 days ago",
                      imageURL: "images/apple-macbook-pro-m1.jpeg",
                    ),
                    
                  ],
                  
                ),
                */
            ),
          ),
        ],
      ),
    );
  }
}
