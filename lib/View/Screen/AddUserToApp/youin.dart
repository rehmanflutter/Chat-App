import 'package:chat/Controller/AddUsertoAppControler/GoogelLogin/googlelogin.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LestYouIn extends StatelessWidget {
  GoogleLoginUser controler = Get.put(GoogleLoginUser());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 158,
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
                    text: 'Let’s you in',
                    weight: FontWeight.w500,
                    size: 48,
                    col: Colors.white,
                  )),
                ),
                Positioned(
                    bottom: 0,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.height * 0.09,
                  ),
                  InkWell(
                    onTap: () {
                      controler.signInWithGoogle();

                      //   Henadlegogalbtclick();
                      // GoogleloginP.Henadlegogalbtclick(context);
                    },
                    child: Container(
                      height: media.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/iconImages/gogal.png',
                            height: 24,
                            width: 24,
                          ),
                          Textcustam(
                            text: '  Continue with Google',
                            weight: FontWeight.w600,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      //
                      Get.toNamed('/PhoneNoSigup');
                    },
                    child: Container(
                      height: media.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          Textcustam(
                            text: '  Continue with Phone No',
                            weight: FontWeight.w600,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      //
                      Get.toNamed('/FillYourProfile');
                    },
                    child: Container(
                      height: media.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                          ),
                          Textcustam(
                            text: '  Continue with E-mail',
                            weight: FontWeight.w600,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Textcustam(text: '  OR  '),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                  RoundButton(
                    title: 'Login with password',
                    fun: () {
                      Get.toNamed('/Login');
                    },
                    col: Color(0xff111827),
                  ),
                  SizedBox(
                    height: media.height * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
