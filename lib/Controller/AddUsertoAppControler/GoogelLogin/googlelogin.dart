import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginUser extends GetxController {
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User user = userCredential.user!;

      // User is now signed in; you can save their data to Firestore
      final firestore = FirebaseFirestore.instance;
      final String uid = user.uid;
      final String displayName = user.displayName ?? 'Anonymous';
      final String photoURL = user.photoURL ?? '';

      // Define your Firestore document reference
      DocumentReference userDoc = firestore.collection('User').doc(uid);

      // Data to save
      Map<String, dynamic> userData = {
        'name': displayName,
        'profilepic': photoURL,
        'Id': uid,
        "status": '',
        'coverPic': '',
        'About': '',
        'work': '',
        'form': '',
        'livein': '',
        'link': '',
        "NicName": '',
        "Gender": '',
      };

      // Set the data in Firestore
      await userDoc.set(userData);

      // Navigate to the next screen after successful sign-in and data save
      Get.offAllNamed('/BottomappBar');
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.white);
      // Handle the error appropriately
      print(e.toString());
    }
  }
}
