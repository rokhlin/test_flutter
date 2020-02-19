// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImagePath.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagePath _$ImagePathFromJson(Map<String, dynamic> json) {
  return ImagePath(
    json['aspect'] as String,
    json['default'] as String,
    json['background'] as String,
    json['originTag'] as String,
  );
}

Map<String, dynamic> _$ImagePathToJson(ImagePath instance) => <String, dynamic>{
      'aspect': instance.aspect,
      'default': instance.xDefault,
      'background': instance.background,
      'originTag': instance.originTag,
    };
