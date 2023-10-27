import 'dart:io';
import 'package:chat/Model/MessageSendModel/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';
import '../../View/counst.dart';

class AudioController extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;
  final String currentUserId = authfirbase.currentUser!.uid;

  RxBool isRecording = false.obs;
  RxString audioUrl = ''.obs;

  Future<void> startRecording() async {
    if (await Record().hasPermission()) {
      await Record().start();
      isRecording.value = true;
    }
  }

  Future<void> stopRecording(String id) async {
    String? path = await Record().stop();
    isRecording.value = false;
    File audioFile = File(path!); // Convert the String path to a File object

    // Generate a unique filename using the Uuid package
    String filename = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('SendVice').child(filename);
    var uploadTask = await ref.putFile(audioFile);
    String videoUrl = await uploadTask.ref.getDownloadURL();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      type: 'vice',
      senderId: currentUserId,
      reciverId: id,
      message: videoUrl,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, id];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firebaseStore
        .collection('Chat_room')
        .doc(chatRoomId)
        .collection('message')
        .add(newMessage.toMap());
  }
}
