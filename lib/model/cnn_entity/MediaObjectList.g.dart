// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MediaObjectList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CNNMediaObjectList _$CNNMediaObjectListFromJson(Map<String, dynamic> json) {
  return CNNMediaObjectList(
    (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : CNNMediaObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CNNMediaObjectListToJson(CNNMediaObjectList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
