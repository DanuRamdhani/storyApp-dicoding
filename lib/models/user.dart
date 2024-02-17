// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes, sort_constructors_first

import 'dart:convert';

import 'package:story_app/utils/typedef.dart';

class User {
  User({
    this.error,
    this.message,
    this.loginResult,
  });

  final bool? error;
  final String? message;
  final LoginResult? loginResult;

  factory User.fromRawJson(String str) =>
      User.fromJson(json.decode(str) as DataMap);

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(DataMap json) => User(
        error: json["error"] != null ? json["error"] as bool : null,
        message: json["message"] != null ? json["message"] as String : null,
        loginResult: json["loginResult"] != null
            ? LoginResult.fromJson(json["loginResult"] as DataMap)
            : null,
      );

  DataMap toJson() => {
        "error": error,
        "message": message,
        "loginResult": loginResult?.toJson(),
      };
}

class LoginResult {
  late final String userId;
  late final String name;
  late final String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromRawJson(String str) =>
      LoginResult.fromJson(json.decode(str) as DataMap);

  String toRawJson() => json.encode(toJson());

  factory LoginResult.fromJson(DataMap json) => LoginResult(
        userId: json["userId"] as String,
        name: json["name"] as String,
        token: json["token"] as String,
      );

  DataMap toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };
}
