import 'package:test_flutter/model/media_object.dart';

abstract class ConverterFactory<T> {
  MediaObject convertMediaObject(T item);
  Map<String, dynamic> fillCustomFields(T item);
  Map<String, ImageObject> getImages(T item);
  VideoObject getVideoObject(T item);
}
