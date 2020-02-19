import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/model/cnn_entity/MediaObject.dart';

part 'MediaObjectList.g.dart';

@JsonSerializable()
class CNNMediaObjectList {
    List<CNNMediaObject> items;

    CNNMediaObjectList(this.items);

    factory CNNMediaObjectList.fromJson(Map<String, dynamic> json) => _$CNNMediaObjectListFromJson(json);

    Map<String, dynamic> toJson() => _$CNNMediaObjectListToJson(this);
}