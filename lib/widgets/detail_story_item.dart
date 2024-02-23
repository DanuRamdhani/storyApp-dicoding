import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/models/story_detail.dart';

class DetailStoryItem extends StatelessWidget {
  const DetailStoryItem({required this.dStory, super.key});

  final Story dStory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: dStory.photoUrl,
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              height: context.width,
              child: Image.asset(
                'assets/gif/spin.gif',
                height: 70,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            cacheManager: CacheManager(
              Config(
                'cache-detail-story',
                stalePeriod: const Duration(seconds: 3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dStory.name,
                  style: context.text.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(dStory.description),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_outlined,
                          color: context.color.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '289',
                          style: TextStyle(
                            color: context.color.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.mode_comment_outlined,
                          color: context.color.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '17',
                          style: TextStyle(
                            color: context.color.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.send_outlined,
                          color: context.color.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '8',
                          style: TextStyle(
                            color: context.color.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
