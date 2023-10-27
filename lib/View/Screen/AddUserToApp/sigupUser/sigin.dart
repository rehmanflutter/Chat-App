import 'package:chat/Controller/AddUsertoAppControler/SignupControler/sigin_controller.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/CustamWiget/textfiledcustam.dart';
import 'package:chat/View/counst.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiginScreen extends StatelessWidget {
  SiginController controler = Get.put(SiginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                    ),
                    Textfiledcustam(
                      starticon: Icon(Icons.email),
                      hinttext: 'E-mail',
                      controller: controler.emailcon,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Textfiledcustam(
                      starticon: Icon(Icons.lock),
                      hinttext: 'password',
                      controller: controler.passwordcon,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Obx(() => RoundButton(
                          loading: controler.loading.value,
                          title: 'Register',
                          col: colorsss,
                          fun: () {
                            controler.emailtocontinue();
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 153,
            decoration: BoxDecoration(
                color: Color(0xff111827),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
                child: Textcustam(
              text: 'Creat  New  Account',
              weight: FontWeight.w500,
              size: 30,
              col: Colors.white,
            )),
          ),
          Positioned(
              top: 133,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
