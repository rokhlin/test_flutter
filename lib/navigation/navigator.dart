
import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/widgets/datail_page.dart';

navigateToDetailPage(BuildContext context, MediaObject mediaObject){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => DetailItemPage(mediaObject),
  ));
}