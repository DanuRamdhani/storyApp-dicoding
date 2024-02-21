import 'package:story_app/utils/typedef.dart';

class Stories {
  Stories({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory Stories.fromJson(DataMap json) => Stories(
        error: json['error'] as bool,
        message: json['message'] as String,
        listStory: (json['listStory'] as List)
            .map((story) => Story.fromJson(story as DataMap))
            .toList(),
      );

  bool error;
  String message;
  List<Story> listStory;

  DataMap toJson() => {
        'error': error,
        'message': message,
        'listStory': List<dynamic>.from(listStory.map((x) => x.toJson())),
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

  factory Story.fromJson(DataMap json) => Story(
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

  DataMap toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'photoUrl': photoUrl,
        'createdAt': createdAt.toIso8601String(),
        'lat': lat,
        'lon': lon,
      };
}
