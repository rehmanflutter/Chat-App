import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAndReelss extends StatelessWidget {
  String CURRENTID = authfirbase.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Textcustam(
          text: 'Posts',
          size: 20,
          weight: FontWeight.w600,
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        ListTile(
          onTap: () {
            Get.snackbar('Post', 'Add Post Tisting');
          },
          leading: FutureBuilder<String>(
              future: fetchUser('profilepic', CURRENTID),
              builder: (context, snapshot) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data ?? ''),
                );
              }),
          title: Textcustam(
            text: 'What\'s on your mind?',
            size: 16,
            // col: Colors.grey,
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo_album,
                color: Colors.green,
              )),
        ),
        Divider(
          thickness: 5,
          height: 20,
        ),
        SizedBox(
          height: Get.height * 0.02,
        ),
        // Container(
        //   height: Get.height,
        //   child: ListView.builder(
        //     //   physics: NeverScrollableScrollPhysics(),
        //     // Make it non-scrollable
        //     itemBuilder: (context, index) {
        //       return Column(
        //         children: [
        //           ListTile(
        //             leading: FutureBuilder<String>(
        //                 future: fetchUser('profilepic', CURRENTID),
        //                 builder: (context, snapshot) {
        //                   return CircleAvatar(
        //                     backgroundImage: NetworkImage(snapshot.data ?? ''),
        //                   );
        //                 }),
        //             title: GetDataFromFirebase(
        //               fieldd: 'name',
        //               textFontSize: 17,
        //               fontWeight: FontWeight.w500,
        //             ),
        //             subtitle: Textcustam(
        //               text: '17 Aus',
        //               // size: 17,
        //               // weight: FontWeight.w500,
        //             ),
        //             trailing: Icon(Icons.more_vert),
        //           ),
        //           Container(
        //             height: Get.height * 0.4,
        //             color: Colors.amber,
        //             margin: EdgeInsets.only(bottom: 5),
        //           ),
        //           SizedBox(
        //             height: Get.height * 0.01,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               Icon(Icons.favorite_border),
        //               Icon(Icons.comment),
        //               Icon(Icons.share)
        //             ],
        //           ),
        //           SizedBox(
        //             height: Get.height * 0.02,
        //           ),
        //           Divider(
        //             thickness: 10,
        //           )
        //         ],
        //       );
        //     },
        //     itemCount: 7,
        //   ),
        // )
      ],
    );
  }
}
