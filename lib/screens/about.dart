import 'package:ad_listing_full_app/custom-widgets/custom-drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            drawer: CustomDrawer(),

      appBar: AppBar(
        title: Text("About Screen"), 
        ),
        body: Center(
          child: Text("About Screen"),
        ),
    );
  }
}