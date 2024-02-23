import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/widgets/custom_form.dart';
import 'package:story_app/widgets/flag_icon.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routeName = 'auth';

  @override
  Widget build(BuildContext context) {
    final authProv = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        // surfaceTintColor: Colors.transparent,
        actions: const [
          FlagIconWidget(),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/social.png'),
                ),
                const SizedBox(height: 8),
                Text(
                  authProv.isLoginForm
                      ? context.localizations.titleLogin
                      : context.localizations.titleRegister,
                  style: context.text.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const CustomForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
