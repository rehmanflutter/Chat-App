import 'package:chat/Controller/AddUsertoAppControler/AddUserDataProfileControler/profile_controler.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/CustamWiget/textfiledcustam.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/image_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneData extends StatelessWidget {
  ProfileController controler = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    Textcustam(
                      text: 'Profile',
                      weight: FontWeight.w600,
                      size: 24,
                    )
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
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
                Textfiledcustam(
                  hinttext: 'Nic Name',
                  controller: controler.nicnamecon,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Textfiledcustam(
                  controller: controler.gender,
                  hinttext: 'Gender',
                  lasticon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                Obx(() => RoundButton(
                      loading: controler.loding.value,
                      title: 'continue',
                      fun: () async {
                        if (controler.namecon.text.isNotEmpty &&
                            controler.namecon.text.isNotEmpty &&
                            controler.gender.text.isNotEmpty &&
                            controler.imagess != null) {
                          controler.saveuserdata();
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
    );
  }
}
