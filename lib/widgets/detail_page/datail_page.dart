import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/widgets/detail_page/detail_page_description_part.dart';
import 'package:test_flutter/widgets/detail_page/detail_page_poster_part.dart';

class DetailPage extends StatefulWidget{
  final MediaObject mediaObject;
  const DetailPage({Key key, this.mediaObject}): super(key: key);

  @override
  _DetailPageState createState() => new _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  bool isPortrait;


  @override
  Widget build(BuildContext context) {
    print("-------isPortrait: $isPortrait");

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation){
          isPortrait = orientation == Orientation.portrait;

          return Container(
              decoration: BoxDecoration(
                color: Colors.grey,),
              child: SingleChildScrollView(
                scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
                child: isPortrait
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PosterPart(widget.mediaObject, isPortrait),
                    DescriptionPart(widget.mediaObject, isPortrait)
                  ],
                )
                    : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DescriptionPart(widget.mediaObject, isPortrait),
                    PosterPart(widget.mediaObject, isPortrait),

                  ],
                ),
              ));
        },
      ),
    );
  }
}






