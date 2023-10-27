import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/Screen/HomeScreen/chat/chatS.dart';
import 'package:chat/View/counst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineUser extends StatelessWidget {
  ChatControler controler = Get.put(ChatControler());

  final Stream<QuerySnapshot> firData = firstorecus.snapshots();
  // Ensure it's a non-null stream
  final String currentUserId = authfirbase.currentUser!.uid;

  String? useridSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.150,
      // color: Colors.amber,
      child: StreamBuilder<QuerySnapshot>(
        stream: firData,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('An Error');
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              String userId = snapshot.data!.docs[index]['Id'];
              String usename = snapshot.data!.docs[index]['name'];
              String ststas = snapshot.data!.docs[index]['status'];
              useridSave = snapshot.data!.docs[index]['Id'];

              return snapshot.data!.docs[index]['status'] == 'Online'
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(ChatScreen(ID: userId, name: usename));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  foregroundImage: NetworkImage(
                                      '${snapshot.data!.docs[index]['profilepic']}'),
                                  backgroundImage:
                                      AssetImage('images/bacground.jpg'),
                                ),
                                snapshot.data!.docs[index]['status'] == 'Online'
                                    ? CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.green,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Textcustam(
                              text: '${snapshot.data!.docs[index]['name']}',
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox();
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
