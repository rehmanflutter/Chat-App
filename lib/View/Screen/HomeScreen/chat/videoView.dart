import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ComfirmScreen extends StatefulWidget {
  final String videoUrl;
  ComfirmScreen({required this.videoUrl});

  @override
  State<ComfirmScreen> createState() => _ComfirmScreenState();
}

class _ComfirmScreenState extends State<ComfirmScreen> {
  late VideoPlayerController controller;
  Duration totalDuration = Duration.zero; // To store the total video duration
  double videoPosition = 0.0;
  bool isPlaying = false;
  bool isVideoLoaded = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          isVideoLoaded = true;
          totalDuration = controller.value.duration;
        });
        controller.setLooping(true);
      });

    controller.addListener(() {
      setState(() {
        videoPosition = controller.value.position.inMilliseconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    // Format the duration as minutes and seconds
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  void _toggleVideoPlayback() {
    setState(() {
      if (isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
      isPlaying = !isPlaying;
    });
  }

  void _onVideoPositionChanged(double value) {
    final double newPosition =
        value * controller.value.duration.inMilliseconds.toDouble();
    controller.seekTo(Duration(milliseconds: newPosition.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Video'),
        actions: [
          IconButton(
            onPressed: () {
              // Add your download action here
            },
            icon: Icon(
              Icons.download,
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            if (!isVideoLoaded)
              Center(
                child: CircularProgressIndicator(),
              )
            else
              SizedBox(
                width: Get.width,
                height: Get.height / 1.5,
                child: GestureDetector(
                  onTap: _toggleVideoPlayback,
                  child: VideoPlayer(controller),
                ),
              ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            if (isVideoLoaded)
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'Video Time: ${formatDuration(Duration(milliseconds: videoPosition.toInt()))}',
                        // ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  ${formatDuration(Duration(milliseconds: videoPosition.toInt()))}',
                      ),
                      Container(
                        width: Get.width * 0.60,
                        child: Slider(
                          value: videoPosition /
                              controller.value.duration.inMilliseconds
                                  .toDouble(),
                          onChanged: _onVideoPositionChanged,
                        ),
                      ),
                      Text(
                        '${formatDuration(totalDuration)}  ', // Total video duration
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
