import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpExample extends StatefulWidget {
  const HttpExample({Key? key}) : super(key: key);

  @override
  State<HttpExample> createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  var _posts = [];

  makeRequest() {
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .then((resp) {
      // print("Responce happened, then executed");
      // print(res.body);
      // print(json.decode(res.body));
      setState(() {
        _posts = json.decode(resp.body);
      });

      print(_posts[1]['title']);
    }).catchError((err) {
      print("Error happened, catch executed");
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            makeRequest();
          },
        )
      ]),
      body: _posts.isEmpty
          ? Center(
              child: Text("No Data Found"),
            )
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (bc, index) {
                return ListTile(
                  title: Text(_posts[index]['title']),
                  subtitle: Text(_posts[index]['body']),
                );
              },
            ),
    );
  }
}