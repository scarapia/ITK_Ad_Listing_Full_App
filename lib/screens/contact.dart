import 'package:ad_listing_full_app/custom-widgets/custom-drawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Contact Screen"),
      ),
      body: Center(
        child: Text("Contact Screen"),
      ),
    );
  }
}
