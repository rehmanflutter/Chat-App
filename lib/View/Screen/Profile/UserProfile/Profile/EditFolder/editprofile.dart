import 'package:chat/Controller/HomeControler/coverpotoss.dart';
import 'package:chat/Controller/ReciveDataFirstore/image.dart';
import 'package:chat/View/CustamWiget/textBtn.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/EditFolder/Details/uiNameEtc.dart';
import 'package:chat/View/counst.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatelessWidget {
  ProfilpotoChange control = Get.put(ProfilpotoChange());
  CoverPoto CoverControl = Get.put(CoverPoto());

  String CURRENTID = authfirbase.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textcustam(text: 'Edit Profile'),
        backgroundColor: Color(0xff111827),
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Profile Picture',
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  TextBtn(
                    title: 'Edit',
                    fun: () {
                      control.getimage(ImageSource.gallery);
                    },
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetimageFromFirebase(
                data: 'profilepic',
                radius: 70,
              ),
              Divider(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Cover photo',
                    size: 20,
                    weight: FontWeight.w700,
                  ),
                  TextBtn(
                    title: 'Edit',
                    fun: () {
                      CoverControl.coverpic(ImageSource.gallery);
                    },
                  )
                ],
              ),
              FutureBuilder<String>(
                  future: fetchUser('coverPic', CURRENTID),
                  builder: (context, snapshot) {
                    return snapshot.data != ''
                        ? Container(
                            height: Get.height * 0.2,
                            width: Get.width,
                            decoration: BoxDecoration(
                                //ss color: Colors.amber,
                                image: DecorationImage(
                                    image: NetworkImage(snapshot.data ?? ''),

                                    // AssetImage('images/bacground.jpg'
                                    // ),
                                    fit: BoxFit.cover)),
                          )
                        : Container(
                            height: Get.height * 0.2,
                            width: Get.width,
                            decoration: BoxDecoration(
                                //ss color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage('images/bacground.jpg'),
                                    fit: BoxFit.cover)),
                          );
                  }),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Divider(),
              UiNamesetc(text: 'Bio', titles: 'About'),
              UiNamesetc(text: 'Name', titles: 'name'),
              UiNamesetc(text: 'Work', titles: 'work'),
              UiNamesetc(text: 'Form', titles: 'form'),
              UiNamesetc(text: 'LiveIn', titles: 'livein'),
              UiNamesetc(text: 'NicName', titles: 'NicName'),
              UiNamesetc(text: 'Add Social Link', titles: 'link'),
              SizedBox(
                height: Get.height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
