import 'package:chat/Controller/ReciveDataFirstore/OtheSeeProfileControler/givedata.dart';
import 'package:chat/View/CustamWiget/icon_And_btn.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/Screen/HomeScreen/chat/chatS.dart';
import 'package:chat/View/Screen/HomeScreen/chat/fulimageShow.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/EditFolder/Details/details.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeProfilePeople extends StatefulWidget {
  String Id;
  String names;
  String stats;
  SeeProfilePeople(
      {required this.Id, required this.names, required this.stats});

  @override
  State<SeeProfilePeople> createState() => _SeeProfilePeopleState();
}

class _SeeProfilePeopleState extends State<SeeProfilePeople> {
  bool _isLoading = false;

  Future<void> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111827),
        title: GetUserData(
          fieldd: 'name',
          Id: widget.Id,
          textFontSize: 20,
          fontWeight: FontWeight.w700,
        ),
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
                    height: Get.height * 0.350,
                    width: double.infinity,
                  ),
                  FutureBuilder<String>(
                      future: fetchUser('coverPic', widget.Id),
                      builder: (context, snapshot) {
                        return snapshot.data != ''
                            ? InkWell(
                                onTap: () {
                                  Get.to(ImageShowDowload(
                                      imageset: snapshot.data ?? ''));
                                },
                                child: Container(
                                  height: Get.height * 0.270,
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
                                height: Get.height * 0.270,
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
                    bottom: 0,
                    left: 90,
                    right: 100,
                    child: Stack(
                      children: [
                        FutureBuilder<String>(
                            future: fetchUser('profilepic', widget.Id),
                            builder: (context, snapshot) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ImageShowDowload(
                                      imageset: snapshot.data ?? ''));
                                },
                                child: Container(
                                  height: Get.height * 0.190,
                                  width: Get.width * 0.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      shape: BoxShape.circle,
                                      color: Colors.green.shade100,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(snapshot.data ?? ''),
                                          fit: BoxFit.cover)),
                                  // child: GetimageFromFirebase(
                                  //   data: 'profilepic',
                                  //   radius: 30,
                                  // ),
                                ),
                              );
                            }),
                        Positioned(
                            bottom: 8,
                            right: 22,
                            child: FutureBuilder<String>(
                              future: fetchUser('status', widget.Id),
                              builder: (context, snapshot) {
                                return snapshot.data == 'Online'
                                    ? CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.green,
                                      )
                                    : SizedBox();
                              },
                            )),
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
                    GetUserData(
                      fieldd: 'name',
                      Id: widget.Id,
                      textFontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      // color: Colors.amber,
                      child: GetUserData(
                        Id: widget.Id,
                        fieldd: 'About',
                        textFontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconAndBtn(
                          col: Color(0xff111827),
                          title: 'Send Message',
                          fun: () {
                            Get.to(
                                ChatScreen(ID: widget.Id, name: widget.names));
                          },
                          icon: Icon(
                            Icons.message,
                            //  color: Colors.black,
                          ),
                          // textcolor: Colors.black,
                          hight: 40,
                          withs: Get.width * 0.7,
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
                      userId: widget.Id,
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      children: [
                        GetUserData(
                          fieldd: 'name',
                          Id: widget.Id,
                          textFontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        Textcustam(
                          text: ' Posts',
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Divider(
                      thickness: 4,
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.130,
                width: Get.width,
                color: Colors.amber.shade200,
                child: Center(
                    child: Textcustam(
                  text: 'NO Post available',
                  size: 20,
                )),
              ),
              if (_isLoading)
                Center(child: CircularProgressIndicator())
              else
                SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
