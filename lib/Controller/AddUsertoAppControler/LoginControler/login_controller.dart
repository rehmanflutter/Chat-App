import 'package:chat/View/counst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  var loding = false.obs;
  void loginToStart() {
    loding.value = true;

    if (emailcon.text.isNotEmpty && passwordcon.text.isNotEmpty) {
      authfirbase
          .signInWithEmailAndPassword(
              email: emailcon.text, password: passwordcon.text)
          .then((value) {
        Get.offAllNamed('/BottomappBar');

        loding.value = false;
      }).onError((error, e) {
        Get.snackbar('Error', 'Invalid User name and Password');
        loding.value = false;
      });
    } else {
      Get.snackbar('Error', 'Fill all Filed');
      loding.value = false;
    }
  }
}
