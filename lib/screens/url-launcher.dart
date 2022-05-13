import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherExample extends StatelessWidget {
  const URLLauncherExample({Key? key}) : super(key: key);

  _openURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    } else {
      print("can't launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextButton(
          onPressed: () {
            _openURL("tel:+919876543210");
          },
          child: Text("Call"),
        ),
        TextButton(
          onPressed: () {
            _openURL("sms:+919876543210");
          },
          child: Text("SMS"),
        ),
        TextButton(
          onPressed: () {
            _openURL(
                "mailto:sample@demo.com?subject=my subject&body=this is content");
          },
          child: Text("Email"),
        ),
        TextButton(
          onPressed: () {
            _openURL("https:flutter.dev");
          },
          child: Text("Open Website"),
        ),
        TextButton(
          onPressed: () {
            _openURL("whatsapp://send?text=hi there&phone=919500707757");
          },
          child: Text("WhatsApp"),
        ),
      ]),
    );
  }
}