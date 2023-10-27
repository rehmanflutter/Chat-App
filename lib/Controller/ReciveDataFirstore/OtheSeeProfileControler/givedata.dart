import 'package:chat/View/counst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeUserImAGE extends StatelessWidget {
  String data;
  double? radius;
  SeeUserImAGE({required this.data, this.radius});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(authfirbase.currentUser!.uid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final foundValue = userData[data] ?? "";

          return CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(foundValue),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// all dat get to current use

class GetUserData extends StatelessWidget {
  final double? textFontSize;
  final String fieldd;
  final FontWeight? fontWeight;
  final Color? col;
  final String Id;
  GetUserData(
      {required this.fieldd,
      this.textFontSize,
      this.fontWeight,
      this.col,
      required this.Id});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('User').doc(Id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final foundValue = userData[fieldd] ?? "";

          return Text(
            '$foundValue',
            style: TextStyle(
                fontSize: textFontSize,
                fontWeight: FontWeight.w700,
                color: col),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        return SizedBox();
      },
    );
  }
}
