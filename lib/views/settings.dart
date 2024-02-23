import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';
import 'package:story_app/widgets/flag_icon.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.settings),
        centerTitle: true,
        actions: const [
          FlagIconWidget(),
          SizedBox(width: 16),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProv, child) {
          final user = authProv.user?.loginResult;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8).copyWith(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    maxRadius: 32,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/user.png',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user?.name ?? 'anonymous',
                    textAlign: TextAlign.center,
                    style: context.text.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@${user?.name ?? 'anonymous'}',
                    textAlign: TextAlign.center,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.localizations.name),
                        const Text('Edit'),
                      ],
                    ),
                    subtitle: const Text('24'),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Bio'),
                        Text(context.localizations.addBio),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(context.localizations.userName),
                    trailing: const Icon(Icons.copy_rounded),
                  ),
                  ListTile(
                    title: Text(context.localizations.email),
                    trailing: const Icon(Icons.copy_rounded),
                  ),
                  ListTile(
                    title: Text(context.localizations.phone),
                    trailing: const Icon(Icons.copy_rounded),
                  ),
                  ListTile(
                    onTap: () => authProv.showLogoutDialog(context),
                    title: Text(context.localizations.logout),
                    trailing: const Icon(Icons.logout_rounded),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
