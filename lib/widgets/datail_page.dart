

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/widgets/mc_clipper.dart';

class DetailItemPage extends StatelessWidget {
  final MediaObject mediaObject;

  DetailItemPage(this.mediaObject);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        height: CommonThings.size.height,
        width: CommonThings.size.width,
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: Mclipper(),
              child: Container(
                height: 370.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
                child: Stack(
                  children: <Widget>[
                    Image(image: AdvancedNetworkImage(mediaObject.mediaAssets.imagePaths[3].xDefault),
                        fit: BoxFit.cover, width: double.infinity),
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color(0x00000000),
                                const Color(0xD9333333)
                              ],
                              stops: [
                                0.0,
                                0.9
                              ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(0.0, 1.0))),
                      child: Padding(
                        padding: EdgeInsets.only(top: 120.0, left: 95.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              mediaObject.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: "SF-Pro-Display-Bold"),
                            ),
                            Text(
                              mediaObject.episodeName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45.0,
                                  fontFamily: "SF-Pro-Display-Bold"),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 370.0,
              right: -20.0,
              child: FractionalTranslation(
                translation: Offset(0.0, -0.5),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xFFE52020),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 80.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Play Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: "SF-Pro-Display-Bold"),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Icon(Icons.arrow_back,
                                  size: 25.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );

  }

}