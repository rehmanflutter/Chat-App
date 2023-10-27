import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

var colorsss = Color(0xff111827);
var authfirbase = FirebaseAuth.instance;
var firstorecus = FirebaseFirestore.instance.collection("User");
var firbasstoragecus = FirebaseStorage.instance;

// var NICNAME;
// var GENDER;
// var DECEPTION;
// var IMAGE;

Future<String>? fetchUser(String link, String id) async {
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('User').doc(id).get();

  if (snapshot.exists) {
    return snapshot[link];
  }
  return Future.value(link);
}
