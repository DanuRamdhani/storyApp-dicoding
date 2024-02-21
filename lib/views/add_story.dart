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
      appBar: AppBar(title: const Text('Add Story')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer2<StoriesProvider, AuthProvider>(
          builder: (context, storiesProv, authProv, child) {
            final userToken = authProv.user!.loginResult!.token;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: context.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    image: storiesProv.pickedImage != null
                        ? DecorationImage(
                            image: FileImage(storiesProv.pickedImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    maxLines: 3,
                    controller: storiesProv.descCtrl,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'Enter your desc here...',
                      border: InputBorder.none,
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
                const Text(
                  'Take Image From',
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {
                    storiesProv.takeImageCamera();
                  },
                  child: const Text('Camera'),
                ),
                ElevatedButton(
                  onPressed: () {
                    storiesProv.takeImageGallery();
                  },
                  child: const Text('Gallery'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await storiesProv.uploadStory(context, userToken);
                  },
                  child: const Text('Upload'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
