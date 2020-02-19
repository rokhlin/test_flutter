// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MediaAsset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaAsset _$MediaAssetFromJson(Map<String, dynamic> json) {
  return MediaAsset(
    (json['imagePaths'] as List)
        ?.map((e) =>
            e == null ? null : ImagePath.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MediaAssetToJson(MediaAsset instance) =>
    <String, dynamic>{
      'imagePaths': instance.imagePaths,
    };
