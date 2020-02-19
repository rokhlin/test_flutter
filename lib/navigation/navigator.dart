
import 'package:flutter/material.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/widgets/detail_page/datail_page.dart';
import 'package:test_flutter/widgets/video_player_page.dart';

class Router {
  static navigateToDetailPage(BuildContext context, MediaObject mediaObject){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPage(mediaObject: mediaObject,),
        ));
  }


  static navigateToVideoPage(BuildContext context, MediaObject mediaObject){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => VideoPage(mediaObject),
        ));
  }
}

