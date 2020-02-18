// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MediaObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaObject _$MediaObjectFromJson(Map<String, dynamic> json) {
  return MediaObject(
    json['_id'] as String,
    json['isActive'] as bool,
    json['isRemoved'] as bool,
    json['isLocked'] as bool,
    json['CreatedDateTime'] as String,
    json['ModifiedDateTime'] as String,
    json['Version'] as int,
    json['assetName'] as String,
    json['description'] as String,
    json['title'] as String,
    json['headline'] as String,
    json['language'] as String,
    json['authenticationRequired'] as bool,
    json['videoID'] as String,
    json['totalRunTime'] as int,
    json['episodeName'] as String,
    json['mediaAssets'] == null
        ? null
        : MediaAsset.fromJson(json['mediaAssets'] as Map<String, dynamic>),
    json['tmsID'] as String,
    json['isHD'] as bool,
    json['orgReleaseDate'] as String,
    json['lastReleaseDate'] as String,
    json['sourceID'] as String,
    json['sourceSystemName'] as String,
    json['sourceData'] as String,
    json['tmHasBeenProcessed'] as bool,
    json['tmProcessingStatus'] as String,
    json['linearAirDateTime'] as String,
    json['originalPremiereDate'] as String,
    json['titleType'] as String,
    json['episodeNumber'] as String,
    json['seasonNumber'] as String,
    json['titleID'] as int,
    json['seriesTitleID'] as int,
    json['__t'] as String,
    json['__v'] as int,
    json['subTitle'] as String,
    json['rating'] as String,
  );
}

Map<String, dynamic> _$MediaObjectToJson(MediaObject instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'isActive': instance.isActive,
      'isRemoved': instance.isRemoved,
      'isLocked': instance.isLocked,
      'CreatedDateTime': instance.createdDateTime,
      'ModifiedDateTime': instance.modifiedDateTime,
      'Version': instance.version,
      'assetName': instance.assetName,
      'description': instance.description,
      'title': instance.title,
      'headline': instance.headline,
      'language': instance.language,
      'authenticationRequired': instance.authenticationRequired,
      'videoID': instance.videoID,
      'totalRunTime': instance.totalRunTime,
      'episodeName': instance.episodeName,
      'mediaAssets': instance.mediaAssets,
      'tmsID': instance.tmsID,
      'isHD': instance.isHD,
      'orgReleaseDate': instance.orgReleaseDate,
      'lastReleaseDate': instance.lastReleaseDate,
      'sourceID': instance.sourceID,
      'sourceSystemName': instance.sourceSystemName,
      'sourceData': instance.sourceData,
      'tmHasBeenProcessed': instance.tmHasBeenProcessed,
      'tmProcessingStatus': instance.tmProcessingStatus,
      'linearAirDateTime': instance.linearAirDateTime,
      'originalPremiereDate': instance.originalPremiereDate,
      'titleType': instance.titleType,
      'episodeNumber': instance.episodeNumber,
      'seasonNumber': instance.seasonNumber,
      'titleID': instance.titleID,
      'seriesTitleID': instance.seriesTitleID,
      '__t': instance.sT,
      '__v': instance.iV,
      'subTitle': instance.subTitle,
      'rating': instance.rating,
    };
