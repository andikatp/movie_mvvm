import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/res/colours.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    void goBranch(int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.favorite, Icons.person],
        inactiveColor: Colours.secondaryColor.withOpacity(0.5),
        activeColor: Colours.primaryColor,
        gapWidth: 0,
        backgroundColor: Colours.backgroundColor,
        activeIndex: navigationShell.currentIndex,
        elevation: 2,
        onTap: goBranch,
      ),
    );
  }
}
