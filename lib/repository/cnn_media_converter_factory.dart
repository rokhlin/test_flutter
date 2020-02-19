

import 'package:test_flutter/model/cnn_entity/MediaObject.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/repository/converter_factory.dart';

class CNNMediaObjectConverterFactory extends ConverterFactory<CNNMediaObject>{

  MediaObject convertMediaObject(CNNMediaObject item) {
    VideoObject video = getVideoObject(item);
    Map<String, ImageObject> images = getImages(item);
    Map<String, dynamic> customFields = fillCustomFields(item);
    return new MediaObject(
        item.sId,
        item.description,
        item.title,
        item.language,
        video,
        images,
        item.titleType,
        item.episodeNumber,
        item.seasonNumber,
        item.episodeName,
        item.titleID,
        item.seriesTitleID,
        item.subTitle,
        item.rating,
        item.totalRunTime);
  }

  Map<String, dynamic> fillCustomFields(CNNMediaObject item) {
    return new Map<String, dynamic>();
  }

  Map<String, ImageObject> getImages(CNNMediaObject item) {
    Map<String, ImageObject> map = new Map<String, ImageObject>();
    map["base"] = new ImageObject(
      item.mediaAssets.imagePaths[3].aspect,
      null,
      null,
      item.mediaAssets.imagePaths[3].xDefault,
      item.mediaAssets.imagePaths[3].aspect,
      item.mediaAssets.imagePaths[3].originTag,
    );
    return map;
  }

  VideoObject getVideoObject(CNNMediaObject item) {
    return new VideoObject(
        item.description,
        item.title,
        item.language,
        item.videoID,
        item.titleType,
        item.videoID,
        item.totalRunTime,
        item.isHD);

  }

}