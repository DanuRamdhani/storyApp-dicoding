import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/widgets/detail_story_item.dart';

class DetailStoryScreen extends StatelessWidget {
  const DetailStoryScreen({
    required this.storyId,
    super.key,
  });

  static const routeName = 'detail-story';

  final String storyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail ${context.localizations.stories}')),
      body: Consumer2<StoriesProvider, AuthProvider>(
        builder: (context, storiesProv, authProv, child) {
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
              final detailStory = storiesProv.storyDetail!.story;
              return DetailStoryItem(dStory: detailStory);
            },
            error: (value) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Caught an Error',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      onPressed: () async {
                        await storiesProv.getStoryById(context, storyId);
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
