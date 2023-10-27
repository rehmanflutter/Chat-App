import 'dart:io';

import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rx<File?> imagess = Rx<File?>(null);

  // String? downloadUrl;
  final picker = ImagePicker();

  Future<void> getimage(ImageSource source) async {
    XFile? picfile = await picker.pickImage(
      source: source,
      imageQuality: 90,
    );

    if (picfile != null) {
      await cropImage(picfile);
    }
  }

  Future<void> cropImage(XFile fileData) async {
    CroppedFile? _croppedImage = await ImageCropper()
        .cropImage(sourcePath: fileData.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.green,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    ]);
    if (_croppedImage != null) {
      imagess.value = File(_croppedImage.path);
      // downloadUrl = await _uploadStorage(imagess.value!);
    }
  }

// fun to chose

  void optionPic() {
    Get.dialog(
      AlertDialog(
        title: Text('Upload Profile Pic'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt_outlined,
                size: 40,
              ),
              title: Text('Take A picture'),
              onTap: () {
                getimage(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                size: 40,
              ),
              title: Text('Select Form Gallery'),
              onTap: () {
                getimage(ImageSource.gallery);
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

// save image

  Future<String> _uploadStorage(File image) async {
    try {
      // Generate a unique file name or use the user's UID
      String fileName = 'profile_images/${authfirbase.currentUser!.uid}.jpg';

      // Upload the image to Firebase Storage
      await firbasstoragecus.ref(fileName).putFile(image);

      // Get the download URL
      String downloadUrl =
          await firbasstoragecus.ref(fileName).getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  /// save user Data
  ///
  ///
  ///

  var namecon = TextEditingController();
  var nicnamecon = TextEditingController();
  var gender = TextEditingController();

  var loding = false.obs;
  void saveuserdata() async {
    loding.value = true;
    try {
      var id = authfirbase.currentUser!.uid;
      String downloadU = await _uploadStorage(imagess.value!);
      firstorecus.doc(id).set({
        'name': namecon.text,
        "NicName": nicnamecon.text,
        "Gender": gender.text,
        'profilepic': downloadU,
        "status": '',
        'coverPic': '',
        'About': '',
        'work': '',
        'form': '',
        'livein': '',
        'link': '',
        'Id': id,
      }).then((value) {
        loding.value = false;
        Get.offAllNamed('/BottomappBar');
      }).onError((error, stackTrace) {
        //  Get.snackbar('Error', "Check Your email");
        loding.value = false;
      });
    } catch (e) {
      Get.snackbar('Error', 'Check Your email');
    }
  }
}
