import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageShowDowload extends StatelessWidget {
  String imageset;
  ImageShowDowload({required this.imageset});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // IconButton(
            //     onPressed: () async {
            //       try {
            //         await GallerySaver.saveImage(imageset,
            //                 albumName: 'Chat App')
            //             .then((value) {
            //           Get.snackbar('Image', 'Download Complete  ',
            //               colorText: Colors.white);
            //         });
            //       } catch (e) {
            //         Get.snackbar('Image', 'Download Fail  ',
            //             colorText: Colors.white);
            //       }
            //     },
            //     icon: Icon(
            //       Icons.download,
            //       size: 40,
            //     ))
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
          width: double.infinity,
          child: PhotoView(
            imageProvider: NetworkImage(imageset),
          ),
        )

            //
            ));
  }
}
