import 'package:chat/Controller/ChatSevers/chat+ImageSend.dart';
import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/Controller/ReciveDataFirstore/OtheSeeProfileControler/givedata.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'chat_btn_texfiled.dart';

class ChatScreen extends StatelessWidget {
  String ID;
  String name;
  ChatScreen({required this.ID, required this.name});
  ChatControler chatsevers = Get.put(ChatControler());
  controlerImageSend imagecon = Get.put(controlerImageSend());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff111827),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textcustam(text: name),
            SizedBox(
              height: 3,
            ),
            GetUserData(
              fieldd: 'status',
              Id: ID,
              textFontSize: 13,
              //col: Colors.grey,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              imagecon.getimage(ImageSource.camera, ID);
            },
            icon: Icon(Icons.camera_alt_outlined),
          ),
          // Icon(Icons.add_ic_call),
          Textcustam(text: '   '),
          Icon(Icons.more_vert),
          Textcustam(text: '   '),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/lightmod.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 05),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: chatsevers.getMessage(ID, chatsevers.currentid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Textcustam(text: 'Errors ');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      children: snapshot.data!.docs
                          .map((DocumentSnapshot) =>
                              chatsevers.buildMessageitem(DocumentSnapshot))
                          .toList(),
                    );
                  },
                ),
              ),
              BtnAndTextFiled(
                id: ID,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
