import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/views/detail_story.dart';

class ListStoryItem extends StatelessWidget {
  const ListStoryItem({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Consumer<StoriesProvider>(
        builder: (context, storiesProv, _) {
          return ListView.builder(
            controller: scrollController,
            itemCount: storiesProv.storyList.length,
            itemBuilder: (context, index) {
              final story = storiesProv.storyList[index];

              final views = Random().nextInt(1000);

              if (index + 1 == storiesProv.storyList.length &&
                  storiesProv.pageItems != null) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                );
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
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.shade100,
                        height: context.width,
                        child: CachedNetworkImage(
                          imageUrl: story.photoUrl,
                          placeholder: (context, url) => Image.asset(
                            'assets/gif/spin.gif',
                            height: 70,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Views $views'),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
