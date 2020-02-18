import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/entity/ImagePath.dart';
part 'MediaAsset.g.dart';


@JsonSerializable()
class MediaAsset  {
  List<ImagePath> imagePaths;

  MediaAsset(this.imagePaths);

  factory MediaAsset.fromJson(Map<String, dynamic> json) => _$MediaAssetFromJson(json);

  Map<String, dynamic> toJson() => _$MediaAssetToJson(this);
}