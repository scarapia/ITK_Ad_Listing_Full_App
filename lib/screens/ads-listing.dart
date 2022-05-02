import 'package:ad_listing_full_app/custom-widgets/product-card.dart';
import 'package:ad_listing_full_app/screens/create-ad.dart';
import 'package:ad_listing_full_app/screens/settings.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdsListingScreen extends StatefulWidget {
  AdsListingScreen({Key? key}) : super(key: key);

  @override
  State<AdsListingScreen> createState() => _AdsListingScreenState();
}

class _AdsListingScreenState extends State<AdsListingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    this.getAds();
    super.initState();
    
  }

  var _ads = [];
  final List<Map> adsList =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  getAds() {
    http
        //.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .get(Uri.parse(Constants().apiURL + "/ads"))
        .then((resp) {
      // print("Responce happened, then executed");
      // print(res.body);
      print(json.decode(resp.body));
      var temp = json.decode(resp.body);
      setState(() {
        _ads = temp["data"];
      });

      print(_ads[0]['images'][0]);
    }).catchError((err) {
      print("Error happened, catch executed");
      print(err);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Ads Listing"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SettingsScreen()));
                  },
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('images/sundar.png'),
                  ),
                ),
              ],
              backgroundColor: Colors.black,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              backgroundColor: Colors.orange[900],
              onPressed: () {
                Get.to(CreateAdScreen());
              },
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      //crossAxisCount: 2,
                      childAspectRatio: 2 / 2.5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      maxCrossAxisExtent: 200),
                  itemCount: _ads.length,
                  itemBuilder: (BuildContext context, index) {
                    return ProductCard(
                        productName: _ads[index]['title'],
                        price: _ads[index]['price'].toString(),
                        imageURL: _ads[index]['images'][0],
                        description: _ads[index]['description']);
                  }),
            )

            

            ));
  }
}
