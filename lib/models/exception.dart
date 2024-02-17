// ignore_for_file: prefer_single_quotes, sort_constructors_first

import 'dart:convert';

class Exception {
  Exception({
    required this.error,
    required this.message,
  });

  bool error;
  String message;

  factory Exception.fromRawJson(String str) =>
      Exception.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory Exception.fromJson(Map<String, dynamic> json) => Exception(
        error: json["error"] as bool,
        message: json["message"] as String,
      );

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
