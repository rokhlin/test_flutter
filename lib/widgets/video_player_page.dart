import 'package:test_flutter/model/MediaObject.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  MediaObject _mediaObject;

  VideoPage(this._mediaObject);

  @override
  _VideoPageState createState() => _VideoPageState(_mediaObject);
}

class _VideoPageState extends State<VideoPage> {
  MediaObject _mediaObject;

  _VideoPageState(this._mediaObject);

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_mediaObject.videoID)
      ..initialize().then((_) {

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),Container(
          margin: EdgeInsets.all(50),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Color(0xFFEF5350),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        )
        ,
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
