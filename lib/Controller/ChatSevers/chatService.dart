import 'package:chat/Model/MessageSendModel/messageModel.dart';
import 'package:chat/View/Screen/HomeScreen/chat/chat_buble.dart';
import 'package:chat/View/Screen/HomeScreen/chat/fulimageShow.dart';
import 'package:chat/View/Screen/HomeScreen/chat/vedioSend.dart';
import 'package:chat/View/Screen/HomeScreen/chat/viceSee.dart';
import 'package:chat/View/counst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatControler extends GetxController {
  // chat send textfiled controler

  TextEditingController chatcontroler = TextEditingController();
  final String currentUserId = authfirbase.currentUser!.uid;

  // get instance of auth and fir

  final _firbaseauth = FirebaseAuth.instance;
  final _firbasestor = FirebaseFirestore.instance;

  Future<void> sendMessage(String reciveId, String message) async {
    //get current user info
    final String currentUserId = _firbaseauth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

//creat new message
    Message newMessage = Message(
        senderId: currentUserId,
        reciverId: reciveId,
        message: message,
        timestamp: timestamp,
        type: 'f');

//construct chat room id and receriver id  (Store to ensure people )

    List<String> ids = [currentUserId, reciveId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firbasestor
        .collection('Chat_room')
        .doc(chatRoomId)
        .collection('message')
        .add(newMessage.toMap());
    // .orderBy('timestamp', descending: false)
    // .snapshots();
  }

// get Message

  Stream<QuerySnapshot> getMessage(String userid, String otheruserid) {
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firbasestor
        .collection('Chat_room')
        .doc(chatRoomId)
        .collection('message')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  // Stream<QuerySnapshot> getlastmessage(String userid, String otheruserid) {
  //   List<String> ids = [userid, otheruserid];
  //   ids.sort();
  //   String chatRoomId = ids.join("_");
  //   return _firbasestor
  //       .collection('Chat_room')
  //       .doc(chatRoomId)
  //       .collection('message')
  //       .orderBy('timestamp', descending: true)
  //       .limit(1)
  //       .snapshots();
  // }

  Widget buildMessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == currentid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return data['type'] == 'f'
        ? Container(
            alignment: alignment,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: (data['senderId'] == currentid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  ChatBuble(
                    message: data['message'],
                    col: (data['senderId'] == currentid)
                        ? Color(0xff111827)
                        : Colors.grey.shade200,
                    time: data['timestamp'],
                    textcol: (data['senderId'] == currentid)
                        ? Colors.grey.shade200
                        : Colors.black,
                  )
                ],
              ),
            ),
          )
        : data['type'] == 'vice'
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: (data['senderId'] == currentid)
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    ViceSeeUser(
                      urlVice: data['message'],
                      senderid: data['senderId'],
                      time: findtime(data['timestamp']),
                    ),
                    // Row(
                    //   //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(),
                    //     Textcustam(
                    //       text: findtime(data['timestamp']),
                    //       size: 12,
                    //       col: Colors.grey,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
            : data['type'] == 't'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: (data['senderId'] == currentid)
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(ImageShowDowload(
                                imageset: data['message'],
                              ));
                            },
                            child: Container(
                              alignment: alignment,
                              width: Get.width * 0.5,
                              height: Get.height * 0.230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (data['senderId'] == currentid
                                      ? Color(0xffd9fdd3)
                                      : Colors.grey.shade200),
                                  border: Border.all(
                                      width: 5,
                                      color: (data['senderId'] == currentid
                                          ? Color(0xffd9fdd3)
                                          : Colors.grey.shade200)),
                                  image: DecorationImage(
                                      image: NetworkImage(data['message']),
                                      fit: BoxFit.cover)),

                              // child: data['message'] != ''
                              //     ? Image.network(data['message'])
                              //     : CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : data['type'] == 'v'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: (data['senderId'] == currentid)
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            VideoSendChat(videoUrl: data['message']
                                // playImmediately: true,
                                ),
                          ],
                        ),
                      )
                    : Text('not Such Dta');
  }

  final currentid = FirebaseAuth.instance.currentUser!.uid;

  String findtime(Timestamp time) {
    DateTime dateTime = time.toDate();

    // Format the date, hour, and minute
    String formattedDate = DateFormat('MMM d, y').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }
}
