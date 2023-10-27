import 'dart:io';
import 'package:chat/Model/MessageSendModel/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class controlerImageSend extends GetxController {
  final _firbaseauth = FirebaseAuth.instance;
  final _firbasestor = FirebaseFirestore.instance;
  Rx<File?> imagess = Rx<File?>(null);

  final picker = ImagePicker();

  Future<void> getimage(ImageSource source, String id) async {
    XFile? picfile = await picker.pickImage(
      source: source,
      imageQuality: 90,
    );

    if (picfile != null) {
      await cropImage(picfile, id);
    }
  }

  Future<void> cropImage(XFile fileData, String id) async {
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
      uploadImage(id);
    }
  }

  Future uploadImage(String id) async {
    String filename = Uuid().v1();
// imagen add

    var ref = FirebaseStorage.instance
        .ref()
        .child('Sendimages')
        .child('${filename}.jpg');
    var uploadTask = await ref.putFile(imagess.value!);
    String imageurl = await uploadTask.ref.getDownloadURL();

    final String currentUserId = _firbaseauth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

//creat new message show image in message
    Message newMessage = Message(
        senderId: currentUserId,
        reciverId: id,
        message: imageurl,
        timestamp: timestamp,
        type: 't');

//construct chat room id and receriver id  (Store to ensure people )

    List<String> ids = [currentUserId, id];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firbasestor
        .collection('Chat_room')
        .doc(chatRoomId)
        .collection('message')
        .add(newMessage.toMap());
  }
}
