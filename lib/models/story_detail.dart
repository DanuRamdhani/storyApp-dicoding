import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'story_detail.g.dart';
part 'story_detail.freezed.dart';

@freezed
class StoryDetail with _$StoryDetail {
  const factory StoryDetail({
    required bool error,
    required String message,
    required DStory story,
  }) = _StoryDetail;

  factory StoryDetail.fromJson(DataMap json) => _$StoryDetailFromJson(json);
}

@freezed
class DStory with _$DStory {
  const factory DStory({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _DStory;

  factory DStory.fromJson(DataMap json) => _$DStoryFromJson(json);
}
