import 'package:chat/Controller/HomeControler/coverpotoss.dart';
import 'package:chat/Controller/ProfileUser/profilecontroler.dart';
import 'package:chat/Controller/ReciveDataFirstore/image.dart';
import 'package:chat/View/CustamWiget/icon_And_btn.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/Screen/HomeScreen/chat/fulimageShow.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/PostAndRells/postReels.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'EditFolder/Details/details.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileControlers Profilecontroler = Get.put(ProfileControlers());

  Future<void> _handleRefresh() async {
    // Handle the refresh action here.
    // For demonstration purposes, we'll just delay for 2 seconds to simulate refreshing.
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  ProfilpotoChange control = Get.put(ProfilpotoChange());
  CoverPoto CoverControl = Get.put(CoverPoto());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111827),
        title: Row(
          children: [
            GetDataFromFirebase(
              fieldd: 'name',
              textFontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/SearchBox');
              },
              icon: Icon(Icons.search)),
          Text('   '),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // color: Colors.red,
                    height: Get.height * 0.310,
                    width: Get.width,
                  ),
                  FutureBuilder<String>(
                      future: fetchUser('coverPic', Profilecontroler.CURRENTID),
                      builder: (context, snapshot) {
                        return snapshot.data != ''
                            ? InkWell(
                                onTap: () {
                                  Get.to(ImageShowDowload(
                                      imageset: snapshot.data ?? ''));
                                },
                                child: Container(
                                  height: Get.height * 0.250,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(snapshot.data ?? ''),

                                          // AssetImage('images/bacground.jpg'
                                          // ),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            : Container(
                                height: Get.height * 0.250,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    //ss color: Colors.amber,
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/bacground.jpg'),
                                        fit: BoxFit.cover)),
                              );
                      }),
                  // camar icon back pic
                  Positioned(
                    bottom: 60,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        CoverControl.coverpic(ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: -25,
                    child: Stack(
                      children: [
                        FutureBuilder<String>(
                            future: fetchUser(
                                'profilepic', Profilecontroler.CURRENTID),
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ImageShowDowload(
                                      imageset: snapshot.data ?? ''));
                                },
                                child: Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      shape: BoxShape.circle,
                                      color: Colors.green.shade100,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(snapshot.data ?? ''),
                                          fit: BoxFit.cover)),
                                ),
                              );
                            }),
                        Positioned(
                          bottom: 0,
                          right: 30,
                          child: InkWell(
                            onTap: () {
                              control.getimage(ImageSource.gallery);
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetDataFromFirebase(
                      fieldd: 'name',
                      textFontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      // color: Colors.amber,
                      child: GetDataFromFirebase(
                        fieldd: 'About',
                        textFontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconAndBtn(
                          col: Color(0xff111827),
                          title: 'Edit Profile',
                          fun: () {
                            Get.toNamed('/EditProfile');
                          },
                          icon: Icon(Icons.edit),
                          hight: 40,
                          withs: Get.width * 0.430,
                        ),
                        IconAndBtn(
                          col: Colors.grey.shade200,
                          title: 'Logout',
                          fun: () {
                            Profilecontroler.logoutfu(context);
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          textcolor: Colors.red,
                          hight: 40,
                          withs: Get.width * 0.430,
                        )
                      ],
                    ),
                    Divider(
                      height: 40,
                      thickness: 10,
                    ),
                    Textcustam(
                      text: 'Details',
                      size: 20,
                      weight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    DetailsUser(
                      userId: Profilecontroler.CURRENTID,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Divider(
                      // indent: 20,
                      // endIndent: 20,
                      thickness: 5,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                  ],
                ),
              ),
              PostAndReelss(),
              if (Profilecontroler.isLoading)
                Center(child: CircularProgressIndicator())
              else
                SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
