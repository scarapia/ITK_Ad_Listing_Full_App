import 'package:flutter/material.dart';
import 'package:ad_listing_full_app/util/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateAdScreen extends StatefulWidget {
  CreateAdScreen({Key? key}) : super(key: key);

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();

  String _imageURL = "";
  var futureImages = [];
  final box = GetStorage();
  //var token =
    //  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjVlYmI4Y2I4ZmRlOGI3YWFiMDliMmIiLCJpYXQiOjE2NTA2NDY1NTF9.owqkxI2TZEcH1yGylr6p15d25-oHbf9nC9LHXGb2cwo";

  createAd() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Create Ad"),
          backgroundColor: Colors.black,
        ),
      body: SafeArea(
       
        
         
          child: ListView(
            
            children: [
              Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                            height: 120,
                            width: 150,
                            //color: Colors.white,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.0, color: Colors.white),
                                    ),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      pickMulipeImage();
                                    }),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('Tap to upload'),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: _titleCtrl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: _priceCtrl,
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Price',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          obscureText: false,
                          controller: _mobileCtrl,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                            controller: _descriptionCtrl,
                            // obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                            style: TextStyle(height: 4.0)),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 360,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[900],
                            ),
                            onPressed: () {
                              createAd();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Submit Ad",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
