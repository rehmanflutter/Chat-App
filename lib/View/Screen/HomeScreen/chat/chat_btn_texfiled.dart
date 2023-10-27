import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/Controller/ChatSevers/chatcontrolEmjeBtn/btnemjocontroler.dart';
import 'package:chat/Controller/ChatSevers/viceSend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnAndTextFiled extends StatefulWidget {
  String id;
  BtnAndTextFiled({required this.id});

  @override
  State<BtnAndTextFiled> createState() => _BtnAndTextFiledState();
}

class _BtnAndTextFiledState extends State<BtnAndTextFiled> {
  ChatControler chatsevers = Get.put(ChatControler());
  ChatContyoleEmje emojiEtcControler = Get.put(ChatContyoleEmje());

  // final FocusNode focusNode = FocusNode();

  AudioController vicecontrol = Get.put(AudioController());
  @override
  Widget build(BuildContext context) {
    bool chose = false;
    return Row(
      children: [
        Expanded(
            child: Container(
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: TextField(
            minLines: 1,
            maxLines: 3,
            controller: chatsevers.chatcontroler,
            cursorHeight: 25,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(

                // gallery btn
                suffixIcon: IconButton(
                  onPressed: () {
                    emojiEtcControler.choseToSelect(context, widget.id);
                  },
                  icon: Icon(
                    Icons.image,
                    size: 30,
                    color: Color(0xff111827),
                  ),
                ),
                hintText: 'Message',
                border: InputBorder.none,
                suffixText: ' ',

                // Emoji btn
                prefixIcon: IconButton(
                    onPressed: () {
                      emojiEtcControler.showEmojiPickerDialog(
                          context, widget.id);
                    },
                    icon: Icon(
                      Icons.tag_faces_outlined,
                      color: Color(0xff111827),
                    ))),
          ),
        )),
        Visibility(
          visible: chatsevers.chatcontroler.text.isEmpty,
          child: GestureDetector(
            onLongPressStart: (_) {
              vicecontrol.startRecording();
            },
            onLongPressEnd: (_) {
              vicecontrol.stopRecording(widget.id);
            },
            child: Obx(
              () => Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(3),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: vicecontrol.isRecording == true
                        ? Colors.red
                        : Color(0xff111827),
                  ),
                  child: Icon(
                    vicecontrol.isRecording == true ? Icons.mic_off : Icons.mic,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),

              // CircleAvatar(
              //   backgroundColor:
              //       vicecontrol.isRecording == true ? Colors.red : Colors.green,
              //   child: Icon(
              //     vicecontrol.isRecording == true ? Icons.mic_off : Icons.mic,
              //     color: Colors.white,
              //     size: 40,
              //   ),
              // ),
            ),
          ),
          replacement: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(3),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff111827)),
              child: IconButton(
                onPressed: () {
                  emojiEtcControler.SendMessage(widget.id);
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// send message to board

}
