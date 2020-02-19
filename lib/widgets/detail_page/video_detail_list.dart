

import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/widgets/detail_page/video_detile_item.dart';
import 'package:test_flutter/widgets/main_page/main_page.dart';

class VideoDetailList extends StatelessWidget{
  final MediaObject _mediaObject;
  final bool isPortrait;
  VideoDetailList(this._mediaObject, this.isPortrait);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: CommonThings.size.width / (isPortrait ? 1 : 2.2),
      //margin: EdgeInsets.all(10),
      alignment: Alignment(-1.0, 0.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              VideoDetails("Language: ${_mediaObject.language}"),
              VideoDetails("Type: ${_mediaObject.titleType}"),
              VideoDetails(
                  "Duration: ${getReadableTime(_mediaObject.totalRunTime)}")
            ],
          )),
    );
  }

  String getReadableTime(int totalRunTime) {
    Duration duration = new Duration(seconds: totalRunTime);
    var hours = duration.inHours;
    var mins = duration.inMinutes;

    return "$hours:$mins";
  }
}