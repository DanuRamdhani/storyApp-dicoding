import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/models/stories.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/views/detail_story.dart';

class ListStoryItem extends StatelessWidget {
  const ListStoryItem({required this.listStory, super.key});

  final List<Story> listStory;

  @override
  Widget build(BuildContext context) {
    final storiesProv = context.read<StoriesProvider>();

    return Padding(
      padding: const EdgeInsets.all(8).copyWith(top: 0),
      child: ListView.builder(
        itemCount: listStory.length,
        itemBuilder: (context, index) {
          final story = listStory[index];

          var views = 0;

          for (var i = 0; i < 1000; i++) {
            views = Random().nextInt(1000);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ).copyWith(right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      story.name,
                      style: context.text.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.goNamed(
                    DetailStoryScreen.routeName,
                    pathParameters: {'id': story.id},
                  );
                  await storiesProv.getStoryById(context, story.id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: story.photoUrl,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      height: context.width,
                      child: Image.asset(
                        'assets/gif/spin.gif',
                        height: 70,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    cacheManager: CacheManager(
                      Config(
                        'cache-list-story',
                        stalePeriod: const Duration(seconds: 3),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text('Views $views'),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
