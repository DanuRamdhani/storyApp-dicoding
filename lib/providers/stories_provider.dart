import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:story_app/models/stories.dart';
import 'package:story_app/models/story_detail.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/providers/tab_provider.dart';
import 'package:story_app/services/api_service.dart';
import 'package:story_app/utils/response_state.dart';
import 'package:story_app/views/list_story.dart';
import 'package:story_app/widgets/custom_snackbar.dart';

class StoriesProvider extends ChangeNotifier {
  Stories? _stories;
  Stories? get stories => _stories;

  StoryDetail? _storyDetail;
  StoryDetail? get storyDetail => _storyDetail;

  File? pickedImage;
  TextEditingController descCtrl = TextEditingController();
  double? lat;
  double? lon;

  bool isUploading = false;

  ResponseState responseState = ResponseState.initial;

  Future<void> getAllStories(BuildContext context) async {
    final authProv = context.read<AuthProvider>();
    final token = authProv.user!.loginResult!.token;
    responseState = ResponseState.loading;
    try {
      final result = await ApiService.getAllStories(context, token);
      if (result == null) return;

      _stories = Stories.fromJson(result);
      responseState = ResponseState.succes;
      notifyListeners();
    } catch (e) {
      responseState = ResponseState.fail;
      notifyListeners();
    }
  }

  Future<void> getStoryById(
    BuildContext context,
    String id,
  ) async {
    final authProv = context.read<AuthProvider>();
    final token = authProv.user!.loginResult!.token;
    responseState = ResponseState.loading;
    try {
      final result = await ApiService.getDetailStory(context, token, id);
      if (result == null) return;

      _storyDetail = StoryDetail.fromJson(result);
      responseState = ResponseState.succes;
      notifyListeners();
    } catch (e) {
      responseState = ResponseState.fail;
      notifyListeners();
    }
  }

  Future<void> uploadStory(
    BuildContext context,
    String token,
  ) async {
    final tabProv = context.read<TabProvider>();
    isUploading = true;
    notifyListeners();

    try {
      if (descCtrl.text.trim().isEmpty || pickedImage == null) {
        customSnackBar(context, 'Please enter description and image');
        isUploading = false;
        notifyListeners();
        return;
      }

      await ApiService.addStory(
        context,
        token,
        descCtrl.text,
        pickedImage!,
        lat,
        lon,
      );

      if (!context.mounted) return;
      tabProv.selectedIndex = 0;
      context.goNamed(ListStoryScreen.routeName);
      pickedImage = null;
      descCtrl.clear();
      await getAllStories(context);
      isUploading = false;
      notifyListeners();
    } catch (e) {
      if (!context.mounted) return;
      isUploading = false;
      customSnackBar(context, 'No internet connections!');
      notifyListeners();
    }
  }

  Future<void> takeImageGallery(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    try {
      final compressedImage = await compressImage(File(image.path));
      pickedImage = compressedImage;
    } catch (e) {
      if (!context.mounted) return;
      customSnackBar(context, 'Cant add this image');
    }

    notifyListeners();
  }

  Future<void> takeImageCamera(BuildContext context) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    try {
      final compressedImage = await compressImage(File(image.path));
      pickedImage = compressedImage;
    } catch (e) {
      if (!context.mounted) return;
      customSnackBar(context, 'Cant add this image');
    }
    notifyListeners();
  }

  Future<File> compressImage(File file) async {
    final filePath = file.path;

    final lastIndex = filePath.lastIndexOf(RegExp('.jp'));
    final splitted = filePath.substring(0, lastIndex);
    final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
    var quality = 80;

    do {
      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        outPath,
        quality: quality,
      );

      final fileSize = await result?.length() ?? 0;

      if (fileSize < 1024 * 1024) {
        return File(result!.path);
      }

      quality -= 10;
    } while (quality >= 10);

    return file;
  }
}
