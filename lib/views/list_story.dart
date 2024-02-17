import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/views/add_story.dart';
import 'package:story_app/views/detail_story.dart';

class ListStoryScreen extends StatelessWidget {
  const ListStoryScreen({super.key});

  static const routeName = 'list-story';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProv, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('listStory'),
            actions: [
              IconButton(
                onPressed: () => authProv.logout(context),
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: Column(
            children: [
              Text(authProv.user?.loginResult?.name ?? 'anonymus'),
              const Text('list-story'),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(DetailStoryScreen.routeName);
                },
                child: const Text('detail'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(AddStoryScreen.routeName);
                },
                child: const Text('add story'),
              ),
            ],
          ),
        );
      },
    );
  }
}
