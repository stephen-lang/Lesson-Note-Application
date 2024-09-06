import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final double opacity;
  final int currentIndex;
  final ValueChanged<int?> onTap;
  final BorderRadius borderRadius;
  final double elevation;
  final bool hasInk;
  final List<AppBottomBarItem> items;

  const AppBottomBar({
    Key? key,
    required this.opacity,
    required this.currentIndex,
    required this.onTap,
    required this.borderRadius,
    required this.elevation,
    required this.hasInk,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(opacity),
      elevation: elevation,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: items.map((item) {
            return BottomNavigationBarItem(
              icon: item.icon,
              activeIcon: item.activeIcon,
              label: item.title.data,
            );
          }).toList(), // Convert AppBottomBarItem to BottomNavigationBarItem
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          backgroundColor: Colors.white.withOpacity(opacity),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          elevation: elevation,
        ),
      ),
    );
  }
}

class AppBottomBarItem {
  final Icon icon;
  final Icon activeIcon;
  final Text title;

  const AppBottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
  });
}