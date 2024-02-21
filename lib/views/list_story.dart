import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/utils/response_state.dart';
import 'package:story_app/views/add_story.dart';
import 'package:story_app/widgets/list_story_item.dart';

class ListStoryScreen extends StatefulWidget {
  const ListStoryScreen({super.key});

  static const routeName = 'list-story';

  @override
  State<ListStoryScreen> createState() => _ListStoryScreenState();
}

class _ListStoryScreenState extends State<ListStoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoriesProvider>().getAllStories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProv, _) {
        final user = authProv.user?.loginResult;

        return Scaffold(
          appBar: AppBar(
            title: const Text('listStory'),
            actions: [
              Text(user?.name ?? 'anonymous'),
              IconButton(
                onPressed: () => authProv.logout(context),
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          body: Consumer<StoriesProvider>(
            builder: (context, storiesProv, _) {
              if (storiesProv.responseState == ResponseState.fail) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Caught an Error\nCheck Internet Connection',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      IconButton(
                        onPressed: () async {
                          await storiesProv.getAllStories(context);
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                );
              }

              if (storiesProv.responseState == ResponseState.succes) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await storiesProv.getAllStories(context);
                  },
                  child: ListStoryItem(
                    listStory: storiesProv.stories!.listStory,
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushNamed(AddStoryScreen.routeName);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
