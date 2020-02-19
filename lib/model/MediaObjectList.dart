import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/model/MediaObject.dart';

part 'MediaObjectList.g.dart';

@JsonSerializable()
class MediaObjectList {
    List<MediaObject> items;

    MediaObjectList(this.items);

    factory MediaObjectList.fromJson(Map<String, dynamic> json) => _$MediaObjectListFromJson(json);

    Map<String, dynamic> toJson() => _$MediaObjectListToJson(this);
}