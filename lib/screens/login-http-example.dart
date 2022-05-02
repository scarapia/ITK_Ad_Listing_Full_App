import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ad_listing_full_app/util/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  login() async {
    print(_emailCtrl.text);
    print(_passwordCtrl.text);
    var resp = await http.post(
      Uri.parse(Constants().apiURL + "/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "email": _emailCtrl.text,
        "password": _passwordCtrl.text,
      }),
    );
    print(json.decode(resp.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: _emailCtrl,
            ),
            TextField(
              controller: _passwordCtrl,
            ),
            TextButton(
              onPressed: () {
                login();
              },
              child: Text("Login"),
            )
          ],
        ));
  }
}