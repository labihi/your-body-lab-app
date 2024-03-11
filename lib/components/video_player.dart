import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String imageUrl;
  const VideoPlayerScreen(this.videoUrl, this.imageUrl, {super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late CachedVideoPlayerController _controller;
  bool playVisible = false;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = CachedVideoPlayerController.network(
      widget.videoUrl,
    );

    // Initialize the controller and store the Future for later use.
    _controller.initialize().then((value) {
      _controller.play();
      setState(() {});
    });
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
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () => setState(() {
              playVisible = !playVisible;
            }),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              // Use the VideoPlayer widget to display the video.
              child: Stack(
                children: [
                  CachedVideoPlayer(_controller),
                  Center(
                    child: AnimatedOpacity(
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: playVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (!playVisible) {
                                playVisible = !playVisible;
                              } else {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              }
                              // If the video is playing, pause it.
                            });
                          },
                          style: TextButton.styleFrom(
                              iconColor: Colors.white,
                              backgroundColor: Colors.black38),
                          child: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 50,
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
            child: Center(
              child: SpinKitPulse(
                color: Colors.green[50],
              ),
            ),
          );
  }
}
