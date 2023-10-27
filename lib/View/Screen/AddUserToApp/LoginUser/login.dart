import 'package:chat/Controller/AddUsertoAppControler/LoginControler/login_controller.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/CustamWiget/textfiledcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  LoginController controler = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                      height: Get.height * 0.350,
                    ),
                    Container(
                      height: media.height * 0.550,
                      child: Column(
                        children: [
                          Textfiledcustam(
                            controller: controler.emailcon,
                            hinttext: 'Email',
                            starticon: Icon(Icons.email),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          ValueListenableBuilder(
                            valueListenable: toggle,
                            builder: (context, value, child) => Textfiledcustam(
                              controller: controler.passwordcon,
                              hinttext: 'Password',
                              starticon: Icon(Icons.lock),
                              lasticon: IconButton(
                                  onPressed: () {
                                    toggle.value = !toggle.value;
                                  },
                                  icon: Icon(toggle.value
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              obscur: toggle.value,
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.07,
                          ),
                          Obx(
                            () => RoundButton(
                              loading: controler.loding.value,
                              title: 'Login',
                              col: colorsss,
                              fun: () {
                                controler.loginToStart();
                              },
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 215,
            decoration: BoxDecoration(
                color: colorsss,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
                child: Textcustam(
              text: 'Login to your Account',
              weight: FontWeight.w600,
              size: 25,
              col: Colors.white,
            )),
          ),
          Positioned(
              top: 195,
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
          Positioned(
            top: 35,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
