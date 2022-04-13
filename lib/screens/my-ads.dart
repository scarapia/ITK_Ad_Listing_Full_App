import 'package:ad_listing_full_app/custom-widgets/product-card.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatefulWidget {
  MyAdsScreen({Key? key}) : super(key: key);

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
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
                child: ListView(
                  children: [
                    ProductCard(
                      title: "Samsung For Sale",
                      price: 12000.0,
                      timesAgo: "8 days ago",
                      imageURL: "images/mobile_2.jpeg",
                    ),
                    ProductCard(
                      title: "Iphone For Sale",
                      price: 33000.0,
                      timesAgo: "18 days ago",
                      imageURL: "images/mobile_1.jpeg",
                    ),
                    ProductCard(
                      title: "Used MAcbook Pro for sale",
                      price: 45000.0,
                      timesAgo: "14 days ago",
                      imageURL: "images/apple-macbook-pro-m1.jpeg",
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}