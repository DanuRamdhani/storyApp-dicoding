// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryDetail _$StoryDetailFromJson(Map<String, dynamic> json) {
  return _StoryDetail.fromJson(json);
}

/// @nodoc
mixin _$StoryDetail {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DStory get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryDetailCopyWith<StoryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryDetailCopyWith<$Res> {
  factory $StoryDetailCopyWith(
          StoryDetail value, $Res Function(StoryDetail) then) =
      _$StoryDetailCopyWithImpl<$Res, StoryDetail>;
  @useResult
  $Res call({bool error, String message, DStory story});

  $DStoryCopyWith<$Res> get story;
}

/// @nodoc
class _$StoryDetailCopyWithImpl<$Res, $Val extends StoryDetail>
    implements $StoryDetailCopyWith<$Res> {
  _$StoryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as DStory,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DStoryCopyWith<$Res> get story {
    return $DStoryCopyWith<$Res>(_value.story, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryDetailImplCopyWith<$Res>
    implements $StoryDetailCopyWith<$Res> {
  factory _$$StoryDetailImplCopyWith(
          _$StoryDetailImpl value, $Res Function(_$StoryDetailImpl) then) =
      __$$StoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, DStory story});

  @override
  $DStoryCopyWith<$Res> get story;
}

/// @nodoc
class __$$StoryDetailImplCopyWithImpl<$Res>
    extends _$StoryDetailCopyWithImpl<$Res, _$StoryDetailImpl>
    implements _$$StoryDetailImplCopyWith<$Res> {
  __$$StoryDetailImplCopyWithImpl(
      _$StoryDetailImpl _value, $Res Function(_$StoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_$StoryDetailImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as DStory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryDetailImpl implements _StoryDetail {
  const _$StoryDetailImpl(
      {required this.error, required this.message, required this.story});

  factory _$StoryDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryDetailImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  final DStory story;

  @override
  String toString() {
    return 'StoryDetail(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryDetailImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryDetailImplCopyWith<_$StoryDetailImpl> get copyWith =>
      __$$StoryDetailImplCopyWithImpl<_$StoryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryDetailImplToJson(
      this,
    );
  }
}

abstract class _StoryDetail implements StoryDetail {
  const factory _StoryDetail(
      {required final bool error,
      required final String message,
      required final DStory story}) = _$StoryDetailImpl;

  factory _StoryDetail.fromJson(Map<String, dynamic> json) =
      _$StoryDetailImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  DStory get story;
  @override
  @JsonKey(ignore: true)
  _$$StoryDetailImplCopyWith<_$StoryDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DStory _$DStoryFromJson(Map<String, dynamic> json) {
  return _DStory.fromJson(json);
}

/// @nodoc
mixin _$DStory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DStoryCopyWith<DStory> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DStoryCopyWith<$Res> {
  factory $DStoryCopyWith(DStory value, $Res Function(DStory) then) =
      _$DStoryCopyWithImpl<$Res, DStory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class _$DStoryCopyWithImpl<$Res, $Val extends DStory>
    implements $DStoryCopyWith<$Res> {
  _$DStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DStoryImplCopyWith<$Res> implements $DStoryCopyWith<$Res> {
  factory _$$DStoryImplCopyWith(
          _$DStoryImpl value, $Res Function(_$DStoryImpl) then) =
      __$$DStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      DateTime createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class __$$DStoryImplCopyWithImpl<$Res>
    extends _$DStoryCopyWithImpl<$Res, _$DStoryImpl>
    implements _$$DStoryImplCopyWith<$Res> {
  __$$DStoryImplCopyWithImpl(
      _$DStoryImpl _value, $Res Function(_$DStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$DStoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DStoryImpl implements _DStory {
  const _$DStoryImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.createdAt,
      this.lat,
      this.lon});

  factory _$DStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DStoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String photoUrl;
  @override
  final DateTime createdAt;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'DStory(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DStoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, photoUrl, createdAt, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DStoryImplCopyWith<_$DStoryImpl> get copyWith =>
      __$$DStoryImplCopyWithImpl<_$DStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DStoryImplToJson(
      this,
    );
  }
}

abstract class _DStory implements DStory {
  const factory _DStory(
      {required final String id,
      required final String name,
      required final String description,
      required final String photoUrl,
      required final DateTime createdAt,
      final double? lat,
      final double? lon}) = _$DStoryImpl;

  factory _DStory.fromJson(Map<String, dynamic> json) = _$DStoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  DateTime get createdAt;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$DStoryImplCopyWith<_$DStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
