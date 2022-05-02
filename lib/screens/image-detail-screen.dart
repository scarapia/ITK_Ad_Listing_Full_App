import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
   final String singleImageURL;
  const ImageDetailScreen({Key? key,
  required this.singleImageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(singleImageURL, height: 300,
        width: double.infinity,),
      ),
    );
  }
}