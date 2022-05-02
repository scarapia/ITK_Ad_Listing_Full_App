import 'package:ad_listing_full_app/screens/image-detail-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
   final String detailProductName;
  final String detailPrice;
  final String detailImageURL;
  final String detailDescription;

  const ProductDetailScreen({Key? key,
    required this.detailProductName,
    required this.detailPrice,
    required this.detailImageURL,
    required this.detailDescription,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        Get.to(ImageDetailScreen(
          singleImageURL: detailImageURL,
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailProductName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    detailPrice,
                    style: TextStyle(
                      color: Colors.orange[900],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(detailImageURL, fit: BoxFit.cover)),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.person,
                      size: 12,
                      color: Colors.black54,
                    ),
                    Text(
                      "All",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.lock_clock_outlined,
                        size: 12, color: Colors.black54),
                    Text(
                      "14 Days ago",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                child: Text(
                  detailDescription,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: 340,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[800],
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Contact Seller",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}