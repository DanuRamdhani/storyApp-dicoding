import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/views/add_story.dart';
import 'package:story_app/views/auth.dart';
import 'package:story_app/views/detail_story.dart';
import 'package:story_app/views/error_screen.dart';
import 'package:story_app/views/list_story.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/auth',
    routes: [
      GoRoute(
        name: AuthScreen.routeName,
        path: '/auth',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AuthScreen(),
        ),
      ),
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
            path: 'detail-story',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const DetailStoryScreen(),
            ),
          ),
          GoRoute(
            name: AddStoryScreen.routeName,
            path: 'add-story',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const AddStoryScreen(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const ErrorScreen(),
    ),
    refreshListenable: AuthProvider(),
    redirect: (context, state) async {
      final authProv = Provider.of<AuthProvider>(context, listen: false);
      final logginIn = state.matchedLocation == '/${AuthScreen.routeName}';
      print('path : ${state.matchedLocation}');

      await authProv.getUserData();

      print('token router: ${authProv.user?.loginResult?.token}');
      print('name router: ${authProv.user?.loginResult?.name}');
      final isLoggedIn = authProv.user?.loginResult?.token != null;

      if (!logginIn && !isLoggedIn) {
        return '/auth';
      } else if (logginIn && isLoggedIn) {
        return '/list-story';
      } else {
        return null;
      }
    },
  );
}
