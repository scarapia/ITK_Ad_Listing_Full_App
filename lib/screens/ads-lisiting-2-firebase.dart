import 'package:ad_listing_full_app/controllers/ads-controllers.dart';
import 'package:ad_listing_full_app/custom-widgets/product-card-widget.dart';
import 'package:ad_listing_full_app/screens/create-ad-2-firebase.dart';
import 'package:ad_listing_full_app/screens/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsListingsScreen2Firebase extends StatefulWidget {
  AdsListingsScreen2Firebase({Key? key}) : super(key: key);

  @override
  State<AdsListingsScreen2Firebase> createState() =>
      _AdsListingsScreen2FirebaseState();
}

class _AdsListingsScreen2FirebaseState
    extends State<AdsListingsScreen2Firebase> {
  final AdsController _todoController = Get.put(AdsController());
  var userObj = {};
  bool isLoading = true;

  String _profileImage = "";
  var adsObj;
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();

  final TextEditingController _adTitleCtrl = TextEditingController();
  final TextEditingController _adPriceCtrl = TextEditingController();
  final TextEditingController _adImageAdCtrl = TextEditingController();
  CollectionReference adsCollection =
      FirebaseFirestore.instance.collection('ads');

  getUserData() {
    FirebaseFirestore.instance
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((res) {
      setState(
        () {
          userObj = {"id": res.id, ...res.data()!};
          _profileImage = userObj['imageURL'];
        },
      );
    });
  }

  getAdsData() async {
    QuerySnapshot querySnapshotAds = await adsCollection.get();
    setState(() {
      adsObj = querySnapshotAds.docs.map((doc) => doc.data()).toList();
    });
  }

  Future getAdsLoadingController() async {
    var resp = await getAdsData();
    print(adsObj);
    if (resp != "Error") {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    getUserData();
    getAdsLoadingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[900],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  CreateAdScreen2Firebase()));
          // Respond to button press
        },
        child: const Icon(Icons.add_a_photo_outlined),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text("Ads Listing"),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SettingsScreen()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(_profileImage),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ]),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: adsObj.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(objApi: adsObj[index]);
          },
        ),
      ),
    );
  }
}

  /*
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text("Ads"), actions: [
        IconButton(
          icon: const Icon(Icons.account_box),
          onPressed: () {
           // Get.to(MyProfileScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            _todoController.getTask();
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
           // Get.to(SettingsScreen());
          },
        )
      ]),
      body: Obx(
        () => ListView.builder(
          itemCount: _todoController.ads.length,
          itemBuilder: (bc, index) {
            return ListTile(
              title: Text(_todoController.ads[index]['title']),
              onTap: () {
              //  Get.to(EditTaskScreen(task: _todoController.tasks[index]));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateAdScreen2Firebase());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
*/