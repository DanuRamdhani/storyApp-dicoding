import 'package:flutter/material.dart';
import 'package:story_app/widgets/custom_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routeName = 'auth';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
