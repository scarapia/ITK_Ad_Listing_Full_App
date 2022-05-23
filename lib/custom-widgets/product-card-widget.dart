import 'package:ad_listing_full_app/screens/product-detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  //final Map objApi;
   var objApi = {};

   ProductCard({
    Key? key,
    required this.objApi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailScreen(
          objApi: objApi,
        ));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                objApi['images'],
                fit: BoxFit.cover,
              )),
          Container(
            height: 68,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  objApi['title'],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  objApi['price'].toString(),
                  style: TextStyle(
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}