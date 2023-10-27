import 'package:chat/View/CustamWiget/icon_And_btn.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTextfiledUpdat extends StatelessWidget {
  var title;
  String tixt;

  DataTextfiledUpdat({required this.title, required this.tixt});

  TextEditingController editcon = TextEditingController();

  var id = authfirbase.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textcustam(text: tixt),
        backgroundColor: Color(0xff111827),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            TextField(
              autofocus: true,
              controller: editcon,
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.browser_updated_outlined),
                hintText: 'Update',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconAndBtn(
                  textcolor: Colors.red,
                  col: Colors.green.shade200,
                  hight: Get.height * 0.07,
                  icon: Icon(
                    Icons.cancel_schedule_send,
                    color: Colors.red,
                  ),
                  withs: Get.width * 0.4,
                  title: 'Cancle',
                  fun: () {
                    Get.back();

//firstorecus.doc(id).update({title: editcon.text});
                  },
                ),
                IconAndBtn(
                  hight: Get.height * 0.07,
                  icon: Icon(Icons.update),
                  col: Color(0xff111827),
                  withs: Get.width * 0.4,
                  title: 'Update',
                  fun: () {
                    Get.back();
                    firstorecus.doc(id).update({title: editcon.text});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
