import 'package:json_annotation/json_annotation.dart';

part 'ImagePath.g.dart';

@JsonSerializable()
class ImagePath {
	String aspect;
	@JsonKey(name: "default")
	String xDefault;
	String background;
	String originTag;

	ImagePath(this.aspect, this.xDefault, this.background, this.originTag);

	factory ImagePath.fromJson(Map<String, dynamic> json) => _$ImagePathFromJson(json);

	Map<String, dynamic> toJson() => _$ImagePathToJson(this);
}
