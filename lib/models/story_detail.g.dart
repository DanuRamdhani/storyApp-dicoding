// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryDetailImpl _$$StoryDetailImplFromJson(Map<String, dynamic> json) =>
    _$StoryDetailImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: DStory.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoryDetailImplToJson(_$StoryDetailImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };

_$DStoryImpl _$$DStoryImplFromJson(Map<String, dynamic> json) => _$DStoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DStoryImplToJson(_$DStoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };
