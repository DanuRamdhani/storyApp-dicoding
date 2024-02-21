import 'package:flutter/material.dart';
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

    return ListView.builder(
      itemCount: listStory.length,
      itemBuilder: (context, index) {
        final story = listStory[index];
        return GestureDetector(
          onTap: () async {
            context.goNamed(
              DetailStoryScreen.routeName,
              pathParameters: {'id': story.id},
            );
            await storiesProv.getStoryById(context, story.id);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Text(
                  story.name,
                  style: context.text.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.network(
                story.photoUrl,
                height: context.width,
                width: context.width,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}
