import 'package:chat/Controller/ChatSevers/chat+ImageSend.dart';
import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/Controller/ChatSevers/vedio_sendcon.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatContyoleEmje extends GetxController {
  ChatControler chatsevers = Get.put(ChatControler());
  controlerImageSend imagecon = Get.put(controlerImageSend());
  // ChatControler chatsevers = Get.put(ChatControler());

  VedioSendControler vediocontrol = Get.put(VedioSendControler());

// send message to board
  void SendMessage(String id) async {
    if (chatsevers.chatcontroler.text.isNotEmpty) {
      chatsevers.sendMessage(id, chatsevers.chatcontroler.text);
      chatsevers.chatcontroler.clear();
    }
  }

// chose send vedio or inmage
  void choseToSelect(BuildContext context, String id) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: context,
      builder: (context) {
        return Container(
          height: Get.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          vediocontrol.pickVideo(id);
                          Get.back();
                        },
                        icon: Icon(
                          Icons.video_settings_outlined,
                          size: 60,
                        )),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Textcustam(text: 'Video Pick')
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          imagecon.getimage(ImageSource.gallery, id);
                          Get.back();
                        },
                        icon: Icon(
                          Icons.camera_front_rounded,
                          size: 60,
                        )),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Textcustam(text: 'Image Pick')
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

// show emoji owner fun
  void showEmojiPickerDialog(BuildContext context, String id) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: Get.height * 0.450,
            width: Get.width,
            //  color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: TextField(
                          //  obscureText = true,
                          onTap: () {
                            Get.back();
                          },
                          minLines: 1,
                          maxLines: 3,
                          controller: chatsevers.chatcontroler,
                          cursorHeight: 25,
                          decoration: InputDecoration(
                              hintText: 'Message',
                              border: InputBorder.none,
                              suffixText: '    ',
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.keyboard_alt_outlined,
                                    color: Colors.green,
                                  ))),
                        ),
                      )),
                      Container(
                        // color: Colors.amber,
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(3),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: colorsss),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                                SendMessage(id);
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      )
                    ],
                  ),
                ),

                // Expanded(
                //   child: EmojiPicker(
                //     textEditingController: chatsevers.chatcontroler,
                //     config: Config(
                //       columns: 7,
                //       emojiSizeMax: 32,
                //       verticalSpacing: 0,
                //       horizontalSpacing: 0,
                //       gridPadding: EdgeInsets.zero,
                //       initCategory: Category.RECENT,
                //       bgColor: Color(0xFFF2F2F2),
                //       indicatorColor: Colors.blue,
                //       iconColor: Colors.grey,
                //       iconColorSelected: Colors.blue,
                //       backspaceColor: Colors.blue,
                //       skinToneDialogBgColor: Colors.white,
                //       skinToneIndicatorColor: Colors.grey,
                //       enableSkinTones: true,
                //       recentTabBehavior: RecentTabBehavior.RECENT,
                //       recentsLimit: 28,
                //       noRecents: Text(
                //         'No Recents',
                //         style: TextStyle(fontSize: 20, color: Colors.black26),
                //         textAlign: TextAlign.center,
                //       ),
                //       loadingIndicator: const SizedBox.shrink(),
                //       tabIndicatorAnimDuration: kTabScrollDuration,
                //       categoryIcons: const CategoryIcons(),
                //       buttonMode: ButtonMode.MATERIAL,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        });
  }
}
