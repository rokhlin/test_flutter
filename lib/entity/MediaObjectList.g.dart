// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MediaObjectList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaObjectList _$MediaObjectListFromJson(Map<String, dynamic> json) {
  return MediaObjectList(
    (json['items'] as List)
        ?.map((e) =>
            e == null ? null : MediaObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MediaObjectListToJson(MediaObjectList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
