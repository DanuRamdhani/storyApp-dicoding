import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/models/story_detail.dart';
import 'package:story_app/providers/localization_provider.dart';
import 'package:story_app/providers/stories_provider.dart';

class DetailStoryItem extends StatelessWidget {
  const DetailStoryItem({required this.dStory, super.key});

  final DStory dStory;

  @override
  Widget build(BuildContext context) {
    final localProv = context.read<LocalizationProvider>();
    final storiesProv = context.read<StoriesProvider>();
    final dateFormated = DateFormat.yMMMEd(localProv.locale.languageCode)
        .format(dStory.createdAt);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.grey.shade100,
            height: context.width,
            child: CachedNetworkImage(
              imageUrl: dStory.photoUrl,
              placeholder: (context, url) => Image.asset(
                'assets/gif/spin.gif',
                height: 70,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              cacheManager: CacheManager(
                Config(
                  'cache-detail-story',
                  stalePeriod: const Duration(seconds: 3),
                ),
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
                  style: context.text.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(dStory.description),
                const SizedBox(height: 4),
                Text(
                  dateFormated,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (dStory.lat != null && dStory.lon != null)
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          storiesProv.address!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(Icons.location_on, size: 16),
                    ],
                  ),
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
