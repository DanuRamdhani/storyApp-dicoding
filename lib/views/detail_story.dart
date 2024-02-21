import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/utils/response_state.dart';

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
      appBar: AppBar(title: const Text('Detail Story')),
      body: Consumer2<StoriesProvider, AuthProvider>(
        builder: (context, storiesProv, authProv, child) {
          if (storiesProv.responseState == ResponseState.fail) {
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
          }

          if (storiesProv.responseState == ResponseState.succes) {
            final dStory = storiesProv.storyDetail!.story;

            return Column(
              children: [
                Image.network(
                  dStory.photoUrl,
                  height: context.width,
                  width: context.width,
                  fit: BoxFit.cover,
                ),
                Text(dStory.name),
                Text(dStory.description),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
