import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:story_app/utils/const.dart';
import 'package:story_app/utils/typedef.dart';

class ApiService {
  static Future<DataMap> register(
    String email,
    String password,
    String name,
  ) async {
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
}
