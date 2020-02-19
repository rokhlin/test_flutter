import 'package:flutter/material.dart';

class VideoDetails extends StatelessWidget {
  final String mediaInfo;

  VideoDetails(this.mediaInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(this.mediaInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0, fontFamily: "SF-Pro-Display-Bold"))),
    );
  }
}