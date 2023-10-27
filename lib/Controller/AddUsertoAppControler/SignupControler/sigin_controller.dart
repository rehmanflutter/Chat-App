import 'package:chat/Controller/AddUsertoAppControler/AddUserDataProfileControler/profile_controler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SiginController extends GetxController {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  ProfileController controler = Get.put(ProfileController());
  var loading = false.obs; // Use an observable variable
  void emailtocontinue() {
    if (emailcon.text.isNotEmpty && passwordcon.text.isNotEmpty) {
      loading.value = true;
      _auth
          .createUserWithEmailAndPassword(
              email: emailcon.text, password: passwordcon.text)
          .then((value) {
        controler.saveuserdata();
        // Get.offAllNamed('/FillYourProfile');

        loading.value = false;
      }).onError((error, e) {
        loading.value = false;
        Get.snackbar('Error', 'Invalid Email and Password');
      });
    } else {
      Get.snackbar('Error', 'Fill all Filed');
    }
  }
}
