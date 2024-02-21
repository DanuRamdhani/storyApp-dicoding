import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:story_app/models/stories.dart';
import 'package:story_app/models/story_detail.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/services/api_service.dart';
import 'package:story_app/utils/response_state.dart';

class StoriesProvider extends ChangeNotifier {
  Stories? _stories;
  Stories? get stories => _stories;

  StoryDetail? _storyDetail;
  StoryDetail? get storyDetail => _storyDetail;

  File? pickedImage;
  TextEditingController descCtrl = TextEditingController();
  double? lat;
  double? lon;

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
    try {
      if (descCtrl.text.trim().isEmpty || pickedImage == null) {
        print('Please enter description and image');
        return;
        //todo : add scafold messanger
      }

      context.pop();
      await ApiService.addStory(
        context,
        token,
        descCtrl.text,
        pickedImage!,
        lat,
        lon,
      );
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> takeImageGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    pickedImage = File(image.path);
    notifyListeners();
  }

  Future<void> takeImageCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    pickedImage = File(image.path);
    notifyListeners();
  }
}
