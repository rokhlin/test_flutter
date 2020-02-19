import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:test_flutter/model/cnn_entity/MediaObject.dart';
import 'package:test_flutter/model/cnn_entity/MediaObjectList.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/repository/cnn_media_converter_factory.dart';
import 'package:test_flutter/repository/converter_factory.dart';
import 'package:test_flutter/repository/media_objects_repository.dart';

class LocalMediaObjectsRepository implements MediaObjectsRepository {
  ConverterFactory<CNNMediaObject> factory = new CNNMediaObjectConverterFactory();

  @override
  Future<List<MediaObject>> fetchMovies() async {
    return await parseJsonFromAssets("assets/json/test-content.json")
        .then((list) => convertToMediaObjects(list));
  }


  Future<List<CNNMediaObject>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr))
        .then((json) => CNNMediaObjectList.fromJson(json))
        .then((mediaObjectList) => mediaObjectList.items);
  }

  Future<List<MediaObject>> convertToMediaObjects(
      List<CNNMediaObject> list) async {
    return list.map((item) => factory.convertMediaObject(item)).toList();
  }
}