import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/utils/const.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('id');
  Locale get locale => _locale;

  Future<void> setLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kLocalization, languageCode);

    _locale = Locale(languageCode);
    notifyListeners();
  }

  Future<void> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(kLocalization) ?? 'id';

    _locale = Locale(result);
    notifyListeners();
  }
}
