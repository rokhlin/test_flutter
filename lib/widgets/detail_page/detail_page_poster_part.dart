

import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:test_flutter/model/cnn_entity/MediaObject.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/navigation/navigator.dart';
import 'package:test_flutter/widgets/main_page/main_page.dart';
import 'package:test_flutter/widgets/mc_clipper.dart';

class PosterPart extends StatelessWidget {
  final MediaObject mediaObject;
  double mainPageHeight;
  double mainPageWidth;
  final bool isPortrait;

  getMainPageSize(double screenHeight, double screenWidth, double aspectRatio) {

    if (isPortrait) {
      mainPageHeight = screenWidth - (screenWidth / 10);
      mainPageWidth =
      aspectRatio > 1 ? screenWidth : screenWidth / (aspectRatio * 2);
    } else {
      mainPageHeight = screenHeight -(screenHeight/10);
      mainPageWidth = screenWidth / 2;
    }
  }

  PosterPart(this.mediaObject, this.isPortrait) {
    getMainPageSize(CommonThings.size.height, CommonThings.size.width,
        CommonThings.size.aspectRatio);
  }

  @override
  Widget build(BuildContext context) {



    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: Mclipper(),
          child: Container(
            alignment: AlignmentDirectional(1,-1),
            height: mainPageHeight,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
            child: Stack(
              children: <Widget>[
                Image(
                    image: AdvancedNetworkImage(
                        mediaObject.images.values.first.path,
                        useDiskCache: true),
                    fit: BoxFit.cover,
                    width: isPortrait
                        ? double.infinity
                        : null ),
                Container(
                  height: double.infinity,
                  width: isPortrait ? double.infinity : mainPageWidth / 2,
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
                    padding: EdgeInsets.only(
                        top: mainPageHeight - 200, left: mainPageWidth / 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          mediaObject.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: mainPageWidth / 25,
                              fontFamily: "SF-Pro-Display-Bold"),
                        ),
                        Text(
                          mediaObject.episodeName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: mainPageWidth / 17,
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
          top: mainPageHeight - 40,
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
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () =>
                                Router.navigateToVideoPage(context, mediaObject),
                            child: Text(
                              "Play Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: "SF-Pro-Display-Bold"),
                            )),
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
    );
  }
}