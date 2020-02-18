
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/entity/MediaObjectList.dart';

class MediaObjectsRepository {
    Future<List<MediaObject>> fetchMovies(){}
}


class LocalMediaObjectsRepository implements MediaObjectsRepository{
  @override
  Future<List<MediaObject>> fetchMovies() async {
    return await parseJsonFromAssets("assets/json/test-content.json");
  }

  Future<List<MediaObject>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr))
        .then((json) => MediaObjectList.fromJson(json))
        .then((mediaObjectList) =>mediaObjectList.items )

    ;
  }
}