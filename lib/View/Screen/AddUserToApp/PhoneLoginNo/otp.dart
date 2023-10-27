import 'package:chat/Controller/AddUsertoAppControler/PhondAddUser/phone_controller.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTP extends StatelessWidget {
  // final String verifie;
  //OTP({required this.verifie});

  PhoneToLogin controller = Get.put(PhoneToLogin());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.270,
                      ),
                      Textcustam(
                        text: 'Code send to your phoneNo ',
                        size: 17,
                      ),
                      Textcustam(text: controller.phonecon.text.toString()),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 30),
                          child: Pinput(
                              controller: controller.otpcontrol,
                              length: 6,
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 75,
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    // color: Color.fromRGBO(30, 60, 87, 1),
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ))),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      RoundButton(
                        title: 'verify',
                        col: colorsss,
                        fun: () {
                          controller.otpsendRecive();
                        },
                      )
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
                  text: 'verification',
                  size: 35,
                  weight: FontWeight.w600,
                  col: Colors.white,
                ),
              ),
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
      ),
    );
  }
}
