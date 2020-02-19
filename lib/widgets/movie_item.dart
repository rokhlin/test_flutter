
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:test_flutter/model/cnn_entity/MediaObject.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/navigation/navigator.dart';
import 'package:test_flutter/widgets/main_page/main_page.dart';

class MovieItem extends StatelessWidget{
  final MediaObject mediaObject;
  final int numColumns;

  MovieItem(this.mediaObject, this.numColumns);

  double getImageSize(){
    return CommonThings.size.width / (numColumns*1.5);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      child: GestureDetector(
          onTap: () => Router.navigateToDetailPage(context, mediaObject),
          child: Container(
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
            child: Column(

              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  child: Image(
                    image: AdvancedNetworkImage(mediaObject.images.values.first.path, useDiskCache: true),
                    width: double.infinity,
                    height: getImageSize(),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                  child: Text(mediaObject.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32/(numColumns+1), fontFamily: "SF-Pro-Display-Bold")),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text(
                      mediaObject.images.values.first.tag == null ? "" :
                      mediaObject.images.values.first.path,
                    style: TextStyle(
                        fontSize: 24/(numColumns+1), fontFamily: "SF-Pro-Display-Bold"))
                )
              ],
            ),
          )),
    );
  }

}