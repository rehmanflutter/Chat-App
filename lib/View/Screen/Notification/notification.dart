import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textcustam(
          text: 'Notification',
        ),
        centerTitle: true,
        backgroundColor: Color(0xff111827),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 256,
            width: 255,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Newsletter.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 20,
          ),
          Textcustam(
            text: 'No Notifications Yet',
            size: 20,
            weight: FontWeight.w700,
          ),
          SizedBox(
            height: 7,
          ),
          Center(
            child: Container(
              width: Get.width * 0.8,
              child: Textcustam(
                align: TextAlign.center,
                text:
                    'No notification right now, notifications about your activity will show up here.',
                size: 16,
                weight: FontWeight.w400,
                col: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
