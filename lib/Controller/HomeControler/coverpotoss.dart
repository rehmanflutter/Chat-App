import 'package:get/get.dart';
import 'dart:io';
import '../../View/counst.dart';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CoverPoto extends GetxController {
  Rx<File?> imagesscover = Rx<File?>(null);

  Future<void> coverpic(ImageSource source) async {
    XFile? picfile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 90,
    );

    if (picfile != null) {
      await cropImages(picfile);
    }
  }

  Future<void> cropImages(XFile fileData) async {
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
      imagesscover.value = File(_croppedImage.path);
      _uploadStoragecover(imagesscover.value!);
    }
  }

  _uploadStoragecover(File image) async {
    try {
      // Generate a unique file name or use the user's UID
      //String filename = Uuid().v1();
      String fileName = 'Cover_images/${authfirbase.currentUser!.uid}';

      // Upload the image to Firebase Storage
      await firbasstoragecus.ref(fileName).putFile(image);

      // Get the download URL
      String downloadUrl =
          await firbasstoragecus.ref(fileName).getDownloadURL();
      firstorecus
          .doc(authfirbase.currentUser!.uid)
          .update({'coverPic': downloadUrl});
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}

class ProfilpotoChange extends GetxController {
  Rx<File?> imagess = Rx<File?>(null);

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
      _uploadStorage(imagess.value!);
    }
  }

// save image

  _uploadStorage(File image) async {
    try {
      // Generate a unique file name or use the user's UID
      String fileName = 'profile_images/${authfirbase.currentUser!.uid}.jpg';

      // Upload the image to Firebase Storage
      await firbasstoragecus.ref(fileName).putFile(image);

      // Get the download URL
      String dowloadurl = await firbasstoragecus.ref(fileName).getDownloadURL();

      firstorecus
          .doc(authfirbase.currentUser!.uid)
          .update({'profilepic': dowloadurl});
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}
