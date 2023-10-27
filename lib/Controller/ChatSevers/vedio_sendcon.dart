// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';
// import 'package:video_player/video_player.dart';
// import '../../Model/messageModel.dart';

// class VedioSendControler extends GetxController {
//   Rx<VideoPlayerController?> videoPlayerController =
//       Rx<VideoPlayerController?>(null);
//   RxBool isPlaying = RxBool(false);

//   Future<void> pickVideo(String id) async {
//     final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
//     if (video != null) {
//       final videoFile = File(video.path); // Corrected this line
//       await _uploadVideoToStorage(id, videoFile);
//       // videoPlayerController.value = VideoPlayerController.file(videoFile);
//       // await videoPlayerController.value!.initialize();
//       // videoPlayerController.value!.play();
//       // videoPlayerController.value!.setVolume(1);
//       // isPlaying.value = true;
//     }
//   }

//   // @override
//   // void dispose() {
//   //   videoPlayerController.value?.dispose();
//   //   super.dispose();
//   // }

//   final _firebaseAuth = FirebaseAuth.instance;
//   final _firebaseStore = FirebaseFirestore.instance;

//   Future<void> _uploadVideoToStorage(String id, File videoFile) async {
//     String filename = Uuid().v1();
//     var ref = FirebaseStorage.instance.ref().child('SendVideo').child(filename);
//     var uploadTask = await ref.putFile(videoFile);
//     String videoUrl = await uploadTask.ref.getDownloadURL();

//     final String currentUserId = _firebaseAuth.currentUser!.uid;
//     final Timestamp timestamp = Timestamp.now();

//     Message newMessage = Message(
//        type: 'v',
//       senderId: currentUserId,
//       reciverId: id,
//       message: videoUrl,
//       timestamp: timestamp,

//     );

//     List<String> ids = [currentUserId, id];
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     await _firebaseStore
//         .collection('Chat_room')
//         .doc(chatRoomId)
//         .collection('video')
//         .add(newMessage.toMap());
//   }
// }
import 'dart:io';
import 'package:chat/Model/MessageSendModel/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class VedioSendControler extends GetxController {
  Rx<VideoPlayerController?> videoPlayerController =
      Rx<VideoPlayerController?>(null);
  RxBool isPlaying = RxBool(false);
  RxBool isLoading = RxBool(false);

  Future<void> pickVideo(String id) async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      final videoFile = File(video.path);
      isLoading.value = true;
      Get.snackbar('Upload', 'Wait Video is sending');
      try {
        await _uploadVideoToStorage(id, videoFile);
        Fluttertoast.showToast(msg: 'Video uploaded successfully');
      } catch (e) {
        Fluttertoast.showToast(msg: 'Failed to upload video: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;

  Future<void> _uploadVideoToStorage(String id, File videoFile) async {
    String filename = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('SendVideo').child(filename);
    var uploadTask = await ref.putFile(videoFile);
    String videoUrl = await uploadTask.ref.getDownloadURL();

    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      type: 'v',
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
