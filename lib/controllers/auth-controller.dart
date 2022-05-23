import 'package:ad_listing_full_app/controllers/profile-controller.dart';
import 'package:ad_listing_full_app/screens/ads-lisiting-2-firebase.dart';
import 'package:ad_listing_full_app/screens/login-screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController {
  ProfileController _profileCtrl = Get.put(ProfileController());
  var _auth = FirebaseAuth.instance;

  void loginWithEmailPassword(email, password) async {
    var authRes = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (authRes != null) {
      Get.to(AdsListingsScreen2Firebase());
    }
  }

  void registerWithEmailPassword(user) async {
    var authRes = await _auth.createUserWithEmailAndPassword(
      email: user['email'],
      password: user['password'],
    );

    _profileCtrl.createProfileOnFireStore({
      "uid": authRes.user!.uid,
      "displayName": user['displayName'],
      "email": user['email'],
      "mobile": user['mobile'],
      "createdAt": FieldValue.serverTimestamp()
    });
  }

  void loginWithGoogle() async {
    var account = await GoogleSignIn(scopes: ["email"]).signIn();
    var auth = await account!.authentication;
    var credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    var userRef = await _auth.signInWithCredential(credential);
    print(userRef.user);
    if (userRef.additionalUserInfo!.isNewUser) {
      _profileCtrl.createProfileOnFireStore({
        "uid": userRef.user!.uid,
        "displayName": account.displayName,
        "email": account.displayName,
        "mobile": "",
        "createdAt": FieldValue.serverTimestamp()
      });
    }
  }

  void logout() {
    _auth.signOut().then((value) {
      Get.offAll(LoginScreen());
    });
  }
}