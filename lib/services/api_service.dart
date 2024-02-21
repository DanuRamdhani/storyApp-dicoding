import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:story_app/utils/const.dart';
import 'package:story_app/utils/typedef.dart';

class ApiService {
  static Future<DataMap?> register(
    BuildContext context,
    String email,
    String password,
    String name,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      return jsonDecode(response.body) as DataMap;
    } catch (e) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No interner connection!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return null;
    }
  }

  static Future<DataMap?> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      return jsonDecode(response.body) as DataMap;
    } catch (e) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No interner connection!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return null;
    }
  }

  static Future<DataMap?> getAllStories(
    BuildContext context,
    String token,
  ) async {
    final response = await http.get(
      Uri.parse('$baseUrl/stories'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body) as DataMap;
  }

  static Future<DataMap?> getDetailStory(
    BuildContext context,
    String token,
    String id,
  ) async {
    final response = await http.get(
      Uri.parse('$baseUrl/stories/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body) as DataMap;
  }

  static Future<void> addStory(
    BuildContext context,
    String token,
    String desc,
    File photo,
    double? lat,
    double? lon,
  ) async {
    try {
      final request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/stories'));

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      });

      request.fields.addAll({
        'description': desc,
        // 'lat': lat.toString(),
        // 'lon': lon.toString(),
      });

      request.files.add(
        await http.MultipartFile.fromPath(
          'photo',
          photo.path,
        ),
      );

      final response = await request.send();
      print(response.statusCode);
      print('Response body: ${await response.stream.bytesToString()}');
    } catch (e) {
      if (!context.mounted) return null;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No interner connection!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
