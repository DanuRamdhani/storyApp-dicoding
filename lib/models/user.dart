import 'dart:convert';

import 'package:story_app/utils/typedef.dart';

class User {
  User({
    this.error,
    this.message,
    this.loginResult,
  });

  factory User.fromJson(DataMap json) => User(
        error: json['error'] != null ? json['error'] as bool : null,
        message: json['message'] != null ? json['message'] as String : null,
        loginResult: json['loginResult'] != null
            ? LoginResult.fromJson(json['loginResult'] as DataMap)
            : null,
      );

  factory User.fromRawJson(String str) =>
      User.fromJson(json.decode(str) as DataMap);

  final bool? error;
  final String? message;
  final LoginResult? loginResult;

  String toRawJson() => json.encode(toJson());

  DataMap toJson() => {
        'error': error,
        'message': message,
        'loginResult': loginResult?.toJson(),
      };
}

class LoginResult {
  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromRawJson(String str) =>
      LoginResult.fromJson(json.decode(str) as DataMap);

  factory LoginResult.fromJson(DataMap json) => LoginResult(
        userId: json['userId'] as String,
        name: json['name'] as String,
        token: json['token'] as String,
      );
  late final String userId;
  late final String name;
  late final String token;

  String toRawJson() => json.encode(toJson());

  DataMap toJson() => {
        'userId': userId,
        'name': name,
        'token': token,
      };
}
