import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/tab_provider.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: widget.navigationShell,
      ),
      bottomNavigationBar: Consumer<TabProvider>(
        builder: (context, tabProv, _) {
          return BottomNavigationBar(
            selectedItemColor: context.color.primary,
            unselectedItemColor: context.color.primary,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_max_outlined),
                label: context.localizations.stories,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.add_box_outlined),
                label: context.localizations.addStory,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: context.localizations.settings,
              ),
            ],
            currentIndex: tabProv.selectedIndex,
            onTap: (index) {
              tabProv.goToBranch(index, widget.navigationShell);
            },
          );
        },
      ),
    );
  }
}
