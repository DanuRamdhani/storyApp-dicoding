import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    bool? error,
    String? message,
    LoginResult? loginResult,
  }) = _User;

  factory User.fromJson(DataMap json) => _$UserFromJson(json);
}

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResult;

  factory LoginResult.fromJson(DataMap json) => _$LoginResultFromJson(json);
}
