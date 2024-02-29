import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/location.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/views/google_map.dart';

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
        child: Consumer3<StoriesProvider, AuthProvider, LocationProvider>(
          builder: (context, storiesProv, authProv, locProv, child) {
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
                Flexible(
                  flex: 4,
                  child: Container(
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
                    child: Stack(
                      children: [
                        if (storiesProv.pickedImage == null)
                          Center(
                            child: Column(
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
                                    color:
                                        context.color.primary.withOpacity(.4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox(),
                        Positioned(
                          top: 4,
                          left: 4,
                          child: Row(
                            children: [
                              IconButton.outlined(
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () =>
                                    storiesProv.takeImageCamera(context),
                                icon: const Icon(Icons.camera_alt),
                              ),
                              IconButton.outlined(
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () =>
                                    storiesProv.takeImageGallery(context),
                                icon: const Icon(Icons.image_rounded),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 4,
                          right: 4,
                          bottom: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                IconButton.filled(
                                  style: IconButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.goNamed(GoogleMapScreen.routeName);
                                  },
                                  icon: const Icon(Icons.location_on),
                                ),
                                const SizedBox(width: 4),
                                if (storiesProv.lat != null &&
                                    storiesProv.lon != null)
                                  Flexible(
                                    child: Text(
                                      locProv.address,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: context.color.primary,
                                      ),
                                    ),
                                  )
                                else
                                  Text(
                                    'No location yet',
                                    style: TextStyle(
                                      color: context.color.primary,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
