import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/tab_provider.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: navigationShell,
      ),
      bottomNavigationBar: Consumer<TabProvider>(
        builder: (context, tabProv, _) {
          return SlidingClippedNavBar(
            onButtonPressed: (index) {
              tabProv.goToBranch(index, navigationShell);
            },
            activeColor: context.color.primary,
            inactiveColor: context.color.primary,
            selectedIndex: tabProv.selectedIndex,
            barItems: [
              BarItem(
                icon: Icons.home_max_outlined,
                title: context.localizations.stories,
              ),
              BarItem(
                icon: Icons.add_box_outlined,
                title: context.localizations.addStory,
              ),
              BarItem(
                icon: Icons.settings_outlined,
                title: context.localizations.settings,
              ),
            ],
          );
        },
      ),
    );
  }
}
