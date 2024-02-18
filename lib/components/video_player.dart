import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';
import 'package:your_body_lab/services/color.service.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoUrl = "";
  VideoPlayerScreen(this.videoUrl,{super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          widget.videoUrl
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: 16/9,
            // Use the VideoPlayer widget to display the video.
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Center(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        iconColor: Colors.green[50],
                      ),
                      child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow, size: 60,)
                  ),
                )
              ],
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Padding(padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
            child: Center(
              child: SpinKitPulse(
                color: Colors.green[50],
              ),
            ),
          );
        }
      },
    );
  }
}