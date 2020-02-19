

class MediaObject {
  String id;
  String description;
  String title;
  String language;
  VideoObject video;
  Map<String, ImageObject> images;
  String titleType;
  String episodeNumber;
  String seasonNumber;
  String episodeName;
  int titleID;
  int seriesTitleID;
  String subTitle;
  String rating;
  int totalRunTime;
  Map<String, dynamic> customFields;

  MediaObject(this.id, this.description, this.title, this.language, this.video,
      this.images, this.titleType, this.episodeNumber, this.seasonNumber,
  this.episodeName, this.titleID, this.seriesTitleID, this.subTitle,
  this.rating, this.totalRunTime);


}


class VideoObject {
  String description;
  String title;
  String language;
  String videoID;
  String type;
  String path;
  int totalRunTime;
  bool isHd;

  VideoObject(this.description, this.title, this.language, this.videoID,
      this.type, this.path, this.totalRunTime, this.isHd);


}

class ImageObject {
  String name;
  int height;
  int width;
  String path;
  String type;
  String tag;

  ImageObject(this.name, this.height, this.width, this.path, this.type,
      this.tag);


}