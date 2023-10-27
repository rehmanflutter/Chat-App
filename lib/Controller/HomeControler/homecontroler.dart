import 'package:chat/View/counst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeControlers extends GetxController {
  final Stream<QuerySnapshot> firData = firstorecus.snapshots();
  // Ensure it's a non-null stream
  final String currentUserId = authfirbase.currentUser!.uid;

  String? useridSave;

  String findtime(Timestamp time) {
    DateTime dateTime = time.toDate();

    // Format the date, hour, and minute
    String formattedDate = DateFormat('MMM d, y').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }

// check User Online or not

  void updateUseronliy(String statas) async {
    await firstorecus
        .doc(authfirbase.currentUser!.uid)
        .update({'status': statas});
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      updateUseronliy('Online');
      //online
    } else {
      //offline
      updateUseronliy('Offline');
    }
  }
}
