import 'package:ad_listing_full_app/custom-widgets/custom-drawer.dart';
import 'package:ad_listing_full_app/screens/about.dart';
import 'package:ad_listing_full_app/screens/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final String ptitle;
  final String pimageURL;
  final double pprice;
  final String ptimesAgo;
  final String pdescription;

  const ProductDetailScreen(
      {Key? key,
      required this.ptitle,
      required this.pimageURL,
      required this.pprice,
      required this.ptimesAgo,
      required this.pdescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        //leading: Icon(Icons.star),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.asset(
            pimageURL,
            fit: BoxFit.cover,
          ),
        ),
        Text(ptitle),
        Text(pprice.toString()),
        Text(ptimesAgo),
        Text(pdescription),
      ]),
    );
  }
}
