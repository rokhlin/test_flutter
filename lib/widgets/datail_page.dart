import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/main.dart';
import 'package:test_flutter/navigation/navigator.dart';
import 'package:test_flutter/widgets/mc_clipper.dart';

class DetailItemPage extends StatelessWidget {
  final MediaObject mediaObject;
  bool isPortrait;

  DetailItemPage(this.mediaObject);

  @override
  Widget build(BuildContext context) {
    isPortrait = CommonThings.size.height > CommonThings.size.width;
    print("-------isPortrait: $isPortrait");

    return Scaffold(
      body: Container(
          height: CommonThings.size.height,
          width: CommonThings.size.width,
          child: SingleChildScrollView(
            scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
            child: isPortrait
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MainPart(mediaObject,isPortrait),
                      BottomPart(mediaObject, isPortrait)
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MainPart(mediaObject, isPortrait),
                      BottomPart(mediaObject,isPortrait)
                    ],
                  ),
          )),
    );
  }
}

class BottomPart extends StatelessWidget {
  MediaObject mediaObject;
  bool isPortrait;

  BottomPart(this.mediaObject, this.isPortrait);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
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
                  child: Text(mediaObject.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 45.0, fontFamily: "SF-Pro-Display-Bold"))),
            ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment(-1.0, 0.0),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      VideoDetails("Language: ${mediaObject.language}"),
                      VideoDetails("Type: ${mediaObject.titleType}"),
                      VideoDetails(
                          "Duration: ${getReadableTime(mediaObject.totalRunTime)}")
                    ],
                  )),
            )
          ],
        ));
  }

  String getReadableTime(int totalRunTime) {
    Duration duration = new Duration(seconds: totalRunTime);
    var hours = duration.inHours;
    var mins = duration.inMinutes;

    return "$hours:$mins";
  }
}

class VideoDetails extends StatelessWidget {
  String mediaInfo;

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

class MainPart extends StatelessWidget {
  MediaObject mediaObject;
  double mainPageHeight;
  double mainPageWidth;
  bool isPortrait;
  getMainPageSize(double screenHeight, double screenWidth, double aspectRatio) {
    String orientation = screenHeight > screenWidth ? "portrait" : "landscape";
    print(
        "Screen params: orientation: $orientation, $screenHeight x $screenWidth, aspectRatio: $aspectRatio");

    if (orientation == "portrait") {
      mainPageHeight = screenWidth - (screenWidth / 10);
      mainPageWidth =
          aspectRatio > 1 ? screenWidth : screenWidth / (aspectRatio * 2);
    } else {
      print("Not Implemented for Lanscape mode");
      mainPageHeight = screenWidth - (screenWidth / 10);
      mainPageWidth =
          aspectRatio > 1 ? screenWidth : screenWidth / (aspectRatio * 2);
    }
  }

  MainPart(this.mediaObject, this.isPortrait) {
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
                        mediaObject.mediaAssets.imagePaths[3].xDefault),
                    fit: BoxFit.cover,
                    width: isPortrait? double.infinity: mainPageWidth/2 - mainPageWidth/10),
                Container(
                  height: double.infinity,
                  width: isPortrait? double.infinity : mainPageWidth/2,
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
                                navigateToVideoPage(context, mediaObject),
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
