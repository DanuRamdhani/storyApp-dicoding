import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/stories_provider.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  static const routeName = 'add-story';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.localizations.addStory),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer2<StoriesProvider, AuthProvider>(
          builder: (context, storiesProv, authProv, child) {
            final userToken = authProv.user?.loginResult?.token;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.color.primary.withOpacity(.4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    maxLines: 3,
                    controller: storiesProv.descCtrl,
                    decoration: InputDecoration(
                      labelText: context.localizations.labelDesc,
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: context.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.color.primary.withOpacity(.4),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    image: storiesProv.pickedImage != null
                        ? DecorationImage(
                            image: FileImage(storiesProv.pickedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: storiesProv.pickedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: context.color.primary.withOpacity(.4),
                              size: 80,
                            ),
                            Text(
                              context.localizations.noImage,
                              style: context.text.headlineMedium!.copyWith(
                                color: context.color.primary.withOpacity(.4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => storiesProv.takeImageCamera(context),
                        child: const Text('Camera'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => storiesProv.takeImageGallery(context),
                        child: const Text('Gallery'),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: storiesProv.isUploading
                      ? null
                      : () async {
                          await storiesProv.uploadStory(
                            context,
                            userToken ?? 'no token',
                          );
                        },
                  child: storiesProv.isUploading
                      ? const SizedBox.square(
                          dimension: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(context.localizations.upload),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
