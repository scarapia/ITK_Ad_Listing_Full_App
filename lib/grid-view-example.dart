import 'package:flutter/material.dart';
import 'package:ad_listing_full_app/custom-widgets/custom-image-card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  var count = 0;
  var _isOn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 0.75),
          children: [
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
            CustomImageCard(),
          ],
        ),
      ),
    );
  }
}