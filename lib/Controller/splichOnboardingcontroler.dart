import 'package:chat/View/counst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingSplich extends GetxController {
  void movetoscreens() {
    var user = authfirbase.currentUser;
    if (user != null) {
      Get.offNamed('/BottomappBar');
    } else {
      Get.offNamed('/SplichNext');
    }
  }

// on boarding

  List<String> Imageschat = [
    'images/iconImages/as.png',
    'images/iconImages/gbchat.png',
    'images/iconImages/gchat.png',
    // 'images/iconImages/cha.png',
    // 'images/iconImages/Screenshot 2023-10-20 223651.png',
    // 'images/iconImages/Screenshot 2023-10-20 223733.png',
    // 'images/iconImages/asdf.png',
    // 'images/iconImages/cha.png'
  ];
  PageController pagcontrol = PageController();
}
