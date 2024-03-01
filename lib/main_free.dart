import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/app_config.dart';
import 'package:story_app/my_app.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/localization_provider.dart';
import 'package:story_app/providers/location.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/providers/tab_provider.dart';

Future<void> main() async {
  AppConfig(appType: AppType.free);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => StoriesProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => LocalizationProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
