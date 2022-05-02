import 'package:ad_listing_full_app/custom-widgets/custom-drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ad_listing_full_app/custom-widgets/my-ads-widget.dart';

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
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  ),
                  Container(
                    child: Text("Hello"),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[100],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    MyAds(
                      title: "iPhone",
                      price: 400.toString(),
                      timesAgo: "5 mins ago",
                      imageURL: "images/mobile1.jpeg",
                    ),
                    MyAds(
                      title: "Samsung",
                      price: 500.toString(),
                      timesAgo: "15 mins ago",
                      imageURL: "images/mobile2.jpeg",
                    ),
                    MyAds(
                      title: "Android",
                      price: 4000.toString(),
                      timesAgo: "50 mins ago",
                      imageURL: "images/mobile2.jpeg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
