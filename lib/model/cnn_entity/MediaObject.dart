import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/model/cnn_entity/MediaAsset.dart';

part 'MediaObject.g.dart';

@JsonSerializable()
class CNNMediaObject {
	@JsonKey(name: "_id")
	String sId;
	bool isActive;
	bool isRemoved;
	bool isLocked;
	@JsonKey(name: "CreatedDateTime")
	String createdDateTime;
	@JsonKey(name: "ModifiedDateTime")
	String modifiedDateTime;
	@JsonKey(name: "Version")
	int version;
	String assetName;
	String description;
	String title;
	String headline;
	String language;
	bool authenticationRequired;
	String videoID;
	int totalRunTime;
	String episodeName;
	@JsonKey(name: "mediaAssets")
	MediaAsset mediaAssets;
	String tmsID;
	bool isHD;
	String orgReleaseDate;
	String lastReleaseDate;
	String sourceID;
	String sourceSystemName;
	String sourceData;
	bool tmHasBeenProcessed;
	String tmProcessingStatus;
	String linearAirDateTime;
	String originalPremiereDate;
	String titleType;
	String episodeNumber;
	String seasonNumber;
	int titleID;
	int seriesTitleID;
	@JsonKey(name: "__t")
	String sT;
	@JsonKey(name: "__v")
	int iV;
	String subTitle;
	String rating;

	CNNMediaObject(this.sId, this.isActive, this.isRemoved, this.isLocked,
			this.createdDateTime, this.modifiedDateTime, this.version, this.assetName,
			this.description, this.title, this.headline, this.language,
			this.authenticationRequired, this.videoID, this.totalRunTime,
			this.episodeName, this.mediaAssets, this.tmsID, this.isHD,
			this.orgReleaseDate, this.lastReleaseDate, this.sourceID,
			this.sourceSystemName, this.sourceData, this.tmHasBeenProcessed,
			this.tmProcessingStatus, this.linearAirDateTime,
			this.originalPremiereDate, this.titleType, this.episodeNumber,
			this.seasonNumber, this.titleID, this.seriesTitleID, this.sT, this.iV,
			this.subTitle, this.rating);


	factory CNNMediaObject.fromJson(Map<String, dynamic> json) => _$CNNMediaObjectFromJson(json);

	Map<String, dynamic> toJson() => _$CNNMediaObjectToJson(this);


}