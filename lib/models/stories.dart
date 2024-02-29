import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'stories.g.dart';
part 'stories.freezed.dart';

@freezed
class Stories with _$Stories {
  const factory Stories({
    required bool error,
    required String message,
    required List<Story> listStory,
  }) = _Stories;

  factory Stories.fromJson(DataMap json) => _$StoriesFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _Story;

  factory Story.fromJson(DataMap json) => _$StoryFromJson(json);
}
