import 'package:chat/View/Screen/HomeScreen/chat/videoView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoSendChat extends StatefulWidget {
  final String videoUrl;

  VideoSendChat({required this.videoUrl});

  @override
  _VideoSendChatState createState() => _VideoSendChatState();
}

class _VideoSendChatState extends State<VideoSendChat> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown and set state to refresh the widget.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(ComfirmScreen(videoUrl: widget.videoUrl));
          },
          child: Container(
            width: 200,
            height: 250,

            // Set your preferred width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown.shade50,
            ),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 20 / 25, // Adjust the aspect ratio as needed
                  child: _controller.value.isInitialized
                      ? VideoPlayer(_controller)
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
