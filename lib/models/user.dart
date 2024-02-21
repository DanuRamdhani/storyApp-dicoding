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

  final bool? error;
  final String? message;
  final LoginResult? loginResult;

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

  factory LoginResult.fromJson(DataMap json) => LoginResult(
        userId: json['userId'] as String,
        name: json['name'] as String,
        token: json['token'] as String,
      );

  late final String userId;
  late final String name;
  late final String token;

  DataMap toJson() => {
        'userId': userId,
        'name': name,
        'token': token,
      };
}
