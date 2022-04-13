import 'package:flutter/material.dart';

class gridTest extends StatelessWidget {
  const gridTest({Key? key}) : super(key: key);
  static const List imagesData = [
    {
      'title': 'tw',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
    {
      'title': 'fb',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
    {
      'title': 'ig',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
    {
      'title': 'YT',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
    {
      'title': 'Share',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
    {
      'title': 'ratw',
      'url':
          "https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Scaffold(
        body: Center(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 30.0,
            ),
            itemCount: imagesData.length,
            itemBuilder: (BuildContext context, int index) {
              return itemGrid(imagesData[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget itemGrid(Map data) {
    print(data["title"]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Image.network(data["url"]),
          Text(
            data["title"],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
