import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userObj = {}.obs;
  var firestore = FirebaseFirestore.instance;

  createProfileOnFireStore(obj) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    firestore.collection("accounts").doc(uid).set(obj);
  }

  updateProfile(obj) {
    firestore
        .collection("accounts")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(obj);
  }
}