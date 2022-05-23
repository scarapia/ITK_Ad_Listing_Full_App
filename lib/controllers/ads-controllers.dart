import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AdsController extends GetxController {
  List ads = [].obs;
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void addTask(title,price,contactNumber,description) {
    firestore.collection("ads").add({
      "title": title,
      "price":price,
      "contactNumber": contactNumber,
      "description": description,
      "createdAt": FieldValue.serverTimestamp(),
      "uid": auth.currentUser!.uid
    }).then((value) {
      print("ad added");
    }).catchError((e) {
      print(e);
    });
  }

  void updateTask(id, title) {
    firestore.collection("ads").doc(id).update({"title": title});
    //  firestore.collection("tasks").doc(id).update({
    //   "title": title
    // });
  }

  void deleteTask(id) {
    firestore.collection("ads").doc(id).delete();
  }

  void getTask() {
    firestore
        .collection("ads")
        .where(
          'uid',
          isEqualTo: auth.currentUser!.uid,
        )
        .get()
        .then((res) {
      if (res.docs.length > 0) {
        var tmp = [];
        res.docs.forEach((task) {
          tmp.add({
            "id": task.id,
            ...task.data(),
          });
          // tmp.add({
          //   "id": task.id,
          //   "createdAt": task.data()['createdAt'],
          //   "status": task.data()['status'],
          //   "uid": task.data()['uid'],
          //   "title": task.data()['title'],
          // });
          // print(task.id);
          // print(task.data());
        });
        print(tmp);
        ads.assignAll(tmp);
      }
    });
  }
}