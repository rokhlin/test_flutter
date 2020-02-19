
import 'package:flutter/material.dart';
import 'package:test_flutter/model/MediaObject.dart';
import 'package:test_flutter/widgets/detail_page/datail_page.dart';
import 'package:test_flutter/widgets/video_player_page.dart';

navigateToDetailPage(BuildContext context, MediaObject mediaObject){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => DetailPage(mediaObject: mediaObject,),
  ));
}


navigateToVideoPage(BuildContext context, MediaObject mediaObject){
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => VideoPage(mediaObject),
      ));
}