import 'package:chat/Controller/ChatSevers/chatService.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import the intl package for date and time formatting
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  String message;
  final Color col;
  final Timestamp time;
  final Color textcol;
  ChatBuble(
      {required this.message,
      required this.col,
      required this.time,
      required this.textcol});
  ChatControler chatsevers = Get.put(ChatControler());

  @override
  Widget build(BuildContext context) {
    // Convert the Timestamp to a DateTime
    DateTime dateTime = time.toDate();

    // Format the date, hour, and minute
    String formattedDate = DateFormat('MMM d, y').format(dateTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(15, 20),
          bottomRight: Radius.elliptical(15, 20),
          //   bottomLeft: Radius.elliptical(20, 25),
        ),
        color: col,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //sss mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Textcustam(
            text: message,
            size: 17,
            col: textcol,
          ),
          SizedBox(height: Get.height * 0.005),
          Textcustam(
            text: '$formattedTime',
            size: 10,
            col: Colors.grey,
          ),
        ],
      ),
    );
  }
}
