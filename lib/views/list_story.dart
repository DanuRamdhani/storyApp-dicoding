import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/widgets/list_story_item.dart';

class ListStoryScreen extends StatefulWidget {
  const ListStoryScreen({super.key});

  static const routeName = 'list-story';

  @override
  State<ListStoryScreen> createState() => _ListStoryScreenState();
}

class _ListStoryScreenState extends State<ListStoryScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final storiesProv = context.read<StoriesProvider>();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (storiesProv.pageItems != null) {
          storiesProv.getAllStories(context);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.stories),
        centerTitle: true,
      ),
      body: Consumer<StoriesProvider>(
        builder: (context, storiesProv, _) {
          final state = storiesProv.responseState;

          return state.map(
            initial: (value) {
              return const Center(child: Text('No data'));
            },
            loading: (value) {
              return Center(
                child: Image.asset('assets/gif/spin.gif', height: 70),
              );
            },
            loaded: (value) {
              return RefreshIndicator(
                onRefresh: () async {
                  await storiesProv.refreshStory(context);
                },
                child: ListStoryItem(scrollController: scrollController),
              );
            },
            error: (value) {
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
            },
          );
        },
      ),
    );
  }
}
