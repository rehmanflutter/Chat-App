import 'package:chat/Controller/AddUsertoAppControler/AddUserDataProfileControler/profile_controler.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageEdit extends StatelessWidget {
  ProfileController controler = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return Stack(
          children: [
            Container(
              height: 150,
              width: 150,
            ),
            CircleAvatar(
              backgroundColor: colorsss,
              radius: 70,
              backgroundImage: profileController.imagess.value != null
                  ? FileImage(profileController.imagess.value!)
                  : null,
              child: profileController.imagess.value != null
                  ? null
                  : Icon(
                      Icons.person,
                      size: 60,
                    ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  profileController.optionPic();
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
