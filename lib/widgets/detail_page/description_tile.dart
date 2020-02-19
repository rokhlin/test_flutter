

import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';

class DescriptionTile extends StatelessWidget{
  final MediaObject _mediaObject;

  DescriptionTile(this._mediaObject);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: EdgeInsets.all(35.0),
          child: Text(_mediaObject.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 45.0, fontFamily: "SF-Pro-Display-Bold"))),
    );
  }
}