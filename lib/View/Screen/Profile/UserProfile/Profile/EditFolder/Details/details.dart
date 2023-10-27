import 'package:chat/Controller/ReciveDataFirstore/OtheSeeProfileControler/givedata.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsUser extends StatelessWidget {
  String CURRENTID = authfirbase.currentUser!.uid;

  String userId;
  DetailsUser({required this.userId});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.assured_workload,
              color: Colors.grey,
              size: 30,
            ),
            Textcustam(
              text: '  Work at ',
              col: Colors.grey,
              size: 20,
            ),
            Expanded(
              child: Container(
                //color: Colors.amber,
                child: GetUserData(
                  Id: userId,
                  fieldd: 'work',
                  textFontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          children: [
            Icon(
              Icons.home,
              color: Colors.grey,
              size: 30,
            ),
            Textcustam(
              text: '  From :  ',
              col: Colors.grey,
              size: 20,
            ),
            Expanded(
              child: Container(
                //color: Colors.amber,
                child: GetUserData(
                  Id: userId,
                  fieldd: 'form',
                  textFontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey,
              size: 30,
            ),
            Textcustam(
              text: '  Live in  ',
              col: Colors.grey,
              size: 20,
            ),
            Expanded(
              child: Container(
                //color: Colors.amber,
                child: GetUserData(
                  Id: userId,
                  fieldd: 'livein',
                  textFontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Row(
          children: [
            Icon(
              Icons.link,
              color: Colors.grey,
              size: 30,
            ),
            Textcustam(
              text: '  Link  ',
              col: Colors.grey,
              size: 20,
            ),
            Expanded(
              child: FutureBuilder<String>(
                  future: fetchUser('link', userId),
                  builder: (context, snapshot) {
                    return Container(
                      child: TextButton(
                        onLongPress: () {
                          FlutterClipboard.copy(snapshot.data ?? " ");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Link copied to clipboard'),
                          ));
                        },
                        onPressed: () {
                          launchUrl(
                            Uri.parse(snapshot.data ?? " "),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          snapshot.data ?? " ",
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ],
    );
  }
}
