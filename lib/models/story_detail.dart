import 'package:json_annotation/json_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'story_detail.g.dart';

@JsonSerializable()
class StoryDetail {
  StoryDetail({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetail.fromJson(DataMap json) =>
      _$StoryDetailFromJson(json);

  bool error;
  String message;
  DStory story;

  DataMap toJson() => _$StoryDetailToJson(this);
}

@JsonSerializable()
class DStory {
  DStory({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  factory DStory.fromJson(DataMap json) => _$DStoryFromJson(json);

  String id;
  String name;
  String description;
  String photoUrl;
  DateTime createdAt;
  double? lat;
  double? lon;

  DataMap toJson() => _$DStoryToJson(this);
}
