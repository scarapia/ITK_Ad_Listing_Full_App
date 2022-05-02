import 'dart:convert';
import 'dart:io';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  //  TextEditingController _nameCtrl = TextEditingController();

  /// Variables
  //File imageFile;
  String _imageURL = "";
  var futureImages = [];
  final box = GetStorage();
  updateProfile() async {
    var token = box.read('token');
    var resp = await http.post(
      Uri.parse(Constants().apiURL + '/ads'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "title": _titleCtrl.text,
        "description": _descriptionCtrl.text,
        "price": _priceCtrl.text,
        "mobile": _mobileCtrl.text,
        "images": futureImages,
        //"imgURL": "http://site.com/image.png"
      }),
    );
    print(json.decode(resp.body));
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            pickMulipeImage();
          },
          child: Container(

            child: _imageURL != ""
                ? Image.file(File(_imageURL), height: 100, width: 100)
                : Image.asset("images/car_1.jpeg", height: 100, width: 100),
          ),
        ),
        /*TextField(
          controller: _titleCtrl,
        ),
        TextField(
          controller: _descriptionCtrl,
        ),
        TextField(
          controller: _priceCtrl,
        ),
        TextField(
          controller: _mobileCtrl,
        ),
        */
      ],
    );
  }
   pickMulipeImage() async {
     var images = await ImagePicker().pickMultiImage();
     if (images!.isNotEmpty) {
       // upload image
       var request = http.MultipartRequest(
           "POST", Uri.parse(Constants().apiURL + '/upload/photos'));
       images.forEach((image) async {
         request.files
             .add(await http.MultipartFile.fromPath('photos', image.path));
       });

       var res = await request.send();
       var respData = await res.stream.toBytes();
       var respStr = String.fromCharCodes(respData);
       var jsonObj = json.decode(respStr);
       setState(() {

futureImages = jsonObj['data']['path'];

});

       print(jsonObj["data"]["path"]);
     } else {
       print("No image picked");
     }
   }

 
}
