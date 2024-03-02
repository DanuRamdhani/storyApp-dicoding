import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/localization_provider.dart';
import 'package:story_app/views/add_story.dart';
import 'package:story_app/views/auth.dart';
import 'package:story_app/views/detail_story.dart';
import 'package:story_app/views/error.dart';
import 'package:story_app/views/google_map.dart';
import 'package:story_app/views/list_story.dart';
import 'package:story_app/views/main_wrapper.dart';
import 'package:story_app/views/settings.dart';
import 'package:story_app/views/splash.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorAdd =
      GlobalKey<NavigatorState>(debugLabel: 'shellAdd');
  static final _rootNavigatorSetting =
      GlobalKey<NavigatorState>(debugLabel: 'shellSetting');

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainWrapper(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                name: ListStoryScreen.routeName,
                path: '/list-story',
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const ListStoryScreen(),
                ),
                routes: [
                  GoRoute(
                    name: DetailStoryScreen.routeName,
                    path: ':id',
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        key: state.pageKey,
                        child: DetailStoryScreen(
                          storyId: state.pathParameters['id']!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorAdd,
            routes: [
              GoRoute(
                name: AddStoryScreen.routeName,
                path: '/add-story',
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const AddStoryScreen(),
                ),
                routes: [
                  GoRoute(
                    name: GoogleMapScreen.routeName,
                    path: 'map',
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const GoogleMapScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSetting,
            routes: [
              GoRoute(
                name: SettingsScreen.routeName,
                path: '/settings',
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const SettingsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AuthScreen.routeName,
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AuthScreen(),
        ),
      ),
      GoRoute(
        name: SplashScreen.routeName,
        path: '/splash',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    refreshListenable: AuthProvider(),
    redirect: (context, state) async {
      final authProv = context.read<AuthProvider>();
      final localProv = context.read<LocalizationProvider>();
      final logginIn = state.matchedLocation == '/';

      await localProv.getLocale();
      await authProv.getUserData();

      final isLoggedIn = authProv.user?.loginResult?.token != null;

      if (!logginIn && !isLoggedIn) {
        return '/';
      } else if (logginIn && isLoggedIn) {
        return '/splash';
        // return '/list-story';
      } else {
        return null;
      }
    },
  );
}
