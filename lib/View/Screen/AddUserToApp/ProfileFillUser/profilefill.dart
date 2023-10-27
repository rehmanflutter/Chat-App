import 'package:chat/Controller/AddUsertoAppControler/AddUserDataProfileControler/profile_controler.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/CustamWiget/textfiledcustam.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/image_edit.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillYourProfile extends StatelessWidget {
  ProfileController controler = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: media.height * 0.230,
                    ),
                    ImageEdit(),
                    SizedBox(
                      height: media.height * 0.03,
                    ),
                    Textfiledcustam(
                      hinttext: 'Full Name',
                      controller: controler.namecon,
                    ),
                    SizedBox(
                      height: media.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Textfiledcustam(
                            hinttext: 'Nic Name',
                            controller: controler.nicnamecon,
                          ),
                        ),
                        Expanded(
                          // width: Get.width * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Textfiledcustam(
                              controller: controler.gender,
                              hinttext: 'Gender',
                              lasticon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_drop_down)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.height * 0.05,
                    ),
                    Obx(() => RoundButton(
                          loading: controler.loding.value,
                          title: 'continue',
                          col: colorsss,
                          fun: () async {
                            if (controler.namecon.text.isNotEmpty &&
                                controler.namecon.text.isNotEmpty &&
                                controler.gender.text.isNotEmpty &&
                                controler.imagess != null) {
                              Get.toNamed('/SiginScreen');
                            } else {
                              Get.snackbar('Error', 'File All ');
                            }
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                Textcustam(
                  text: 'Profile',
                  col: Colors.white,
                  weight: FontWeight.w600,
                  size: 24,
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
          Positioned(
              top: 134,
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
