import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void goToBranch(int index, StatefulNavigationShell navigationShell) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
    selectedIndex = index;
    notifyListeners();
  }
}
