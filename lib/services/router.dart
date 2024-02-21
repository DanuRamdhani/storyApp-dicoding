import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/views/add_story.dart';
import 'package:story_app/views/auth.dart';
import 'package:story_app/views/detail_story.dart';
import 'package:story_app/views/error.dart';
import 'package:story_app/views/list_story.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AuthScreen.routeName,
        path: '/',
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
      GoRoute(
        name: AddStoryScreen.routeName,
        path: '/add-story',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AddStoryScreen(),
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
      final logginIn = state.matchedLocation == '/';
      await authProv.getUserData();
      final isLoggedIn = authProv.user?.loginResult?.token != null;

      if (!logginIn && !isLoggedIn) {
        return '/';
      } else if (logginIn && isLoggedIn) {
        return '/list-story';
      } else {
        return null;
      }
    },
  );
}
