import 'package:ad_listing_full_app/screens/edit-ad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAds extends StatelessWidget {
  final String imageURL;
  final String title;
  final String price;
  final String timesAgo;

  const MyAds({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.price,
    required this.timesAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /* onTap: () {
        Get.to(ProductDetailScreen(
          ptitle: title,
          pprice: price,
          ptimesAgo: timesAgo,
          pimageURL: imageURL,
          pdescription: "description",
        ));
      },
*/
      onTap: () {
        Get.to(EditAdScreen());
      },
      child: Container(
        //color: Colors.white,
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
        
        child: Row(children: [
          Container(
            height: 100,
            width: 100,
            child: Image.network(imageURL),
            
          ),
          SizedBox(width: 8),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(timesAgo),
                Text(price.toString(), style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange[900]),),
                
              ],
            ),

          ),
        ]),
        
      ),
    );
  }
}
