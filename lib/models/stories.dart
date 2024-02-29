import 'package:json_annotation/json_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'stories.g.dart';

@JsonSerializable()
class Stories {
  Stories({
    required this.error,
    required this.message,
    required this.listStory,
  });

  bool error;
  String message;
  List<Story> listStory;

  factory Stories.fromJson(DataMap json) => _$StoriesFromJson(json);

  DataMap toJson() => _$StoriesToJson(this);
}

@JsonSerializable()
class Story {
  Story({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  String id;
  String name;
  String description;
  String photoUrl;
  DateTime createdAt;
  double? lat;
  double? lon;

  factory Story.fromJson(DataMap json) => _$StoryFromJson(json);

  DataMap toJson() => _$StoryToJson(this);
}
