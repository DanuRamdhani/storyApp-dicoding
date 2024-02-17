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
    routes: [
      GoRoute(
        name: AuthScreen.routeName,
        path: '/auth',
        pageBuilder: (context, state) => const MaterialPage(
          // key: state.pageKey,
          child: AuthScreen(),
        ),
      ),
      GoRoute(
        name: ListStoryScreen.routeName,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          // key: state.pageKey,
          child: ListStoryScreen(),
        ),
        routes: [
          GoRoute(
            name: DetailStoryScreen.routeName,
            path: 'detail-story',
            pageBuilder: (context, state) => const MaterialPage(
              // key: state.pageKey,
              child: DetailStoryScreen(),
            ),
          ),
          GoRoute(
            name: AddStoryScreen.routeName,
            path: 'add-story',
            pageBuilder: (context, state) => const MaterialPage(
              // key: state.pageKey,
              child: AddStoryScreen(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const MaterialPage(
      // key: state.pageKey,
      child: ErrorScreen(),
    ),
    refreshListenable: AuthProvider(),
    redirect: (context, state) async {
      final authProv = context.watch<AuthProvider>();
      // final authProv = Provider.of<AuthProvider>(context, listen: false);

      // final logginIn = state.path == '/${AuthScreen.routeName}';

      await authProv.getUserData();

      print('token router: ${authProv.user?.loginResult?.token}');
      print('name router: ${authProv.user?.loginResult?.name}');
      final isLoggedIn = authProv.user?.loginResult?.token != null;

      if (!isLoggedIn) {
        return '/${AuthScreen.routeName}';
      } else if (isLoggedIn) {
        return '/';
      } else {
        return null;
      }
    },
  );
}
