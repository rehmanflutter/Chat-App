import 'package:chat/Controller/ReciveDataFirstore/image.dart';
import 'package:chat/View/CustamWiget/textBtn.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../updatDataTextfiled.dart';

class UiNamesetc extends StatelessWidget {
  String titles;
  String text;

  UiNamesetc({required this.text, required this.titles});
  String CURRENTID = authfirbase.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Textcustam(
              text: text,
              col: Colors.black38,
              size: 20,
              weight: FontWeight.w700,
            ),
            TextBtn(
              title: 'Edit',
              fun: () {
                Get.to(DataTextfiledUpdat(
                  title: titles,
                  tixt: text,
                ));
                //  UpdataUserData.EditProfile(context,);
              },
            )
          ],
        ),
        Container(
          child: Container(
            // color: Colors.amber,
            child: GetDataFromFirebase(
              fieldd: titles,
              textFontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(
          thickness: 5,
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
      ],
    );
  }
}
