import 'dart:async';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class ViceSeeUser extends StatefulWidget {
  String urlVice;
  String senderid;
  String time;
  ViceSeeUser(
      {required this.urlVice, required this.senderid, required this.time});
  @override
  State<ViceSeeUser> createState() => _ViceRecodeState();
}

class _ViceRecodeState extends State<ViceSeeUser> {
  final currentid = FirebaseAuth.instance.currentUser!.uid;

  late AudioPlayer audioPlayer;

  double audioDuration = 0.0;
  double currentPlaybackPosition = 0.0;
  bool isPlaying = false;
  late Timer positionTimer;

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inMilliseconds.toDouble();
      });
    });
  }

  void dispose() {
    audioPlayer.dispose();
  }

  Future<void> playrecode() async {
    try {
      Source urlsource = UrlSource(widget.urlVice);
      await audioPlayer.play(urlsource);
      setState(() {
        isPlaying = true;
      });

      positionTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        audioPlayer.getCurrentPosition().then((position) {
          setState(() {
            currentPlaybackPosition = position!.inMilliseconds.toDouble();
          });
        });
      });
    } catch (e) {}
  }

  Future<void> pausePlayback() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        positionTimer.cancel();
      });
    }
  }

  void seekToPosition(double value) {
    audioPlayer.seek(Duration(milliseconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    String formattedDuration =
        formatDuration(audioDuration - currentPlaybackPosition);

    return Container(
      height: Get.height * 0.07,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.senderid == currentid
              ? Color(0xffd9fdd3)
              : Colors.grey.shade200),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (isPlaying) {
                      pausePlayback();
                    } else {
                      playrecode();
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    //size: 30,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: Get.height * 0.03,
                // color: Colors.amber,
                child: Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  value: currentPlaybackPosition,
                  min: 0.0,
                  max: audioDuration,
                  onChanged: (value) {
                    if (value >= 0 && value <= audioDuration) {
                      seekToPosition(value);
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    formattedDuration,
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: Get.width * 0.260,
                  ),
                  Textcustam(
                    text: widget.time,
                    size: 12,
                    col: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ],
      ),
      // Display the time from end to start in seconds
    );
  }

  // Helper function to format the duration in seconds
  String formatDuration(double milliseconds) {
    int seconds = (milliseconds / 1000).floor();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
