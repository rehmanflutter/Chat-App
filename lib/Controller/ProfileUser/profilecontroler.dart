import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileControlers extends GetxController {
  String CURRENTID = authfirbase.currentUser!.uid;

  bool isLoading = false;

  void logoutfu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Textcustam(text: 'confirmed to Logout'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Textcustam(
                  text: 'Cancle',
                  col: Colors.green,
                )),
            TextButton(
                onPressed: () {
                  GoogleSignIn().signOut();

                  authfirbase.signOut().then((value) {
                    Get.snackbar('Successful', 'Logout Successful');
                    updateUseronliy();
                    Get.offAllNamed('/SplichNext');
                  }).onError((error, stackTrace) {
                    Get.snackbar('Error', stackTrace.toString());
                  });
                },
                child: Textcustam(
                  text: 'Logout',
                  col: Colors.red,
                )),
          ],
        );
      },
    );
  }

  void updateUseronliy() async {
    await firstorecus
        .doc(authfirbase.currentUser!.uid)
        .update({'status': 'ofline'});
  }
}
