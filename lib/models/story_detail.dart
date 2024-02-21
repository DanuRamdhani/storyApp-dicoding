import 'package:story_app/utils/typedef.dart';

class StoryDetail {
  StoryDetail({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetail.fromJson(Map<String, dynamic> json) => StoryDetail(
        error: json['error'] as bool,
        message: json['message'] as String,
        story: Story.fromJson(json['story'] as DataMap),
      );

  bool error;
  String message;
  Story story;

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'story': story.toJson(),
      };
}

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

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        photoUrl: json['photoUrl'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        lat: json['lat'] != null ? json['lat'] as double : null,
        lon: json['lon'] != null ? json['lon'] as double : null,
      );

  String id;
  String name;
  String description;
  String photoUrl;
  DateTime createdAt;
  double? lat;
  double? lon;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'photoUrl': photoUrl,
        'createdAt': createdAt.toIso8601String(),
        'lat': lat,
        'lon': lon,
      };
}
