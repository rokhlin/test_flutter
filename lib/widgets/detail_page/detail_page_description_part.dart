

import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/widgets/detail_page/description_tile.dart';
import 'package:test_flutter/widgets/detail_page/video_detail_list.dart';

class DescriptionPart extends StatelessWidget {
  final MediaObject mediaObject;
  final bool isPortrait;

  DescriptionPart(this.mediaObject, this.isPortrait);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            DescriptionTile(mediaObject, isPortrait),
            VideoDetailList(mediaObject, isPortrait),
          ],
        ));
  }

}