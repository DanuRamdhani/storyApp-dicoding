import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/models/user.dart';
import 'package:story_app/services/api_service.dart';
import 'package:story_app/utils/const.dart';
import 'package:story_app/views/auth.dart';
import 'package:story_app/views/list_story.dart';

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  User? user;

  String enteredEmail = '';
  String enteredPassword = '';
  String enteredFullname = '';
  bool isAuthenticating = false;
  bool isCantSeePw = true;
  bool isLoginForm = true;

  void isCantSeePwChange() {
    isCantSeePw = !isCantSeePw;
    notifyListeners();
  }

  void isLoginChange() {
    isLoginForm = !isLoginForm;
    notifyListeners();
  }

  Future<void> submit(BuildContext context) async {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();

    isAuthenticating = true;
    notifyListeners();

    if (isLoginForm) {
      final body =
          await ApiService.login(context, enteredEmail, enteredPassword);
      if (body == null) {
        isAuthenticating = false;
        notifyListeners();
        return;
      }

      user = User.fromJson(body);

      if (!context.mounted) return;
      if (body.containsValue('success')) {
        context.goNamed(ListStoryScreen.routeName);
        await saveUserData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${body['message']}'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      isAuthenticating = false;
      notifyListeners();
    } else {
      final body = await ApiService.register(
        enteredEmail,
        enteredPassword,
        enteredFullname,
      );

      if (body.containsValue('User created')) {
        if (!context.mounted) return;
        final body =
            await ApiService.login(context, enteredEmail, enteredPassword);
        if (body == null) {
          isAuthenticating = false;
          notifyListeners();
          return;
        }

        user = User.fromJson(body);
        if (body.containsValue('success')) {
          if (!context.mounted) return;
          context.goNamed(ListStoryScreen.routeName);
          await saveUserData();
        }
        notifyListeners();
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${body['message']}'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      isAuthenticating = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(kToken);
    await prefs.remove(kuserName);
    await prefs.remove(kuserId);
    user = null;
    print('token logout: ${user?.loginResult?.token}');
    print('name logout: ${user?.loginResult?.name}');
    if (!context.mounted) return;
    context.goNamed(AuthScreen.routeName);
    notifyListeners();
  }

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();

    // if (user == null) return;

    await prefs.setString(kuserId, user!.loginResult!.userId);
    await prefs.setString(kuserName, user!.loginResult!.name);
    await prefs.setString(kToken, user!.loginResult!.token);

    print('token save: ${user?.loginResult?.token}');
    print('name save: ${user?.loginResult?.name}');
    // print('(save)initial loc : $initialLoc');
    notifyListeners();
  }

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    final userId = prefs.getString(kuserId);
    final name = prefs.getString(kuserName);
    final token = prefs.getString(kToken);
    notifyListeners();

    if (userId == null || name == null || token == null) {
      return;
    }

    user ??= User.fromJson({
      'error': false,
      'message': 'success',
      'loginResult': {
        'userId': userId,
        'name': name,
        'token': token,
      },
    });
    print('token get : ${user?.loginResult?.token}');
    print('name get : ${user?.loginResult?.name}');
    notifyListeners();
  }
}
