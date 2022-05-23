import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  List tasks = [].obs;
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

  void addTask(title) {
    firestore.collection("tasks").add({
      "title": title,
      "isCompleted": false,
      "createdAt": FieldValue.serverTimestamp(),
      "uid": auth.currentUser!.uid
    }).then((value) {
      print("task added");
    }).catchError((e) {
      print(e);
    });
  }

  void updateTask(id, title) {
    firestore.collection("tasks").doc(id).update({"title": title});
    //  firestore.collection("tasks").doc(id).update({
    //   "title": title
    // });
  }

  void deleteTask(id) {
    firestore.collection("tasks").doc(id).delete();
  }

  void getTask() {
    firestore
        .collection("tasks")
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
        tasks.assignAll(tmp);
      }
    });
  }
}