import 'package:json_annotation/json_annotation.dart';
import 'package:story_app/utils/typedef.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.error,
    this.message,
    this.loginResult,
  });

  factory User.fromJson(DataMap json) => _$UserFromJson(json);

  final bool? error;
  final String? message;
  final LoginResult? loginResult;

  DataMap toJson() => _$UserToJson(this);
}

@JsonSerializable()
class LoginResult {
  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(DataMap json) => _$LoginResultFromJson(json);

  late final String userId;
  late final String name;
  late final String token;

  DataMap toJson() => _$LoginResultToJson(this);
}
