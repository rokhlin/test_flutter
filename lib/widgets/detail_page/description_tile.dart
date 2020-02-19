

import 'package:flutter/material.dart';
import 'package:test_flutter/model/cnn_entity/MediaObject.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/widgets/main_page/main_page.dart';

class DescriptionTile extends StatelessWidget{
  final MediaObject _mediaObject;
  final bool isPortrait;

  DescriptionTile(this._mediaObject, this.isPortrait);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CommonThings.size.width / (isPortrait ? 1 : 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0))
          ]),
      child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(_mediaObject.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 45.0, fontFamily: "SF-Pro-Display-Bold"))),
    );
  }
}