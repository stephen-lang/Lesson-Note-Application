import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:lessonnote/pages/Single.dart';
import 'package:lessonnote/pages/Stream_page.dart';
import 'package:lessonnote/pages/home/dashboard.dart';
 
import 'package:lessonnote/pages/upload.dart';

class AppNavBar extends StatefulWidget {
  final Widget child;

  const AppNavBar({required this.child, super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  static const List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.chat_bubble,
      title: 'Chat',
    ),
    TabItem(
      icon: Icons.upload_file,
      title: 'Upload',
    ),
    TabItem(
      icon: Icons.inbox_rounded,
      title: 'Entry',
    ),
    
  ];

  int selectedIndex = 0;

  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color.fromARGB(255, 3, 6, 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomBarInspiredFancy(
        items: items,
        backgroundColor: const Color.fromARGB(255, 225, 235, 248).withOpacity(0.21),
        color: color,
        colorSelected: colorSelect,
        indexSelected: selectedIndex,
        onTap: (int? index) {
          if (index != null) {
            setState(() {
              selectedIndex = index;
            });
            _onTap(context, index);
          }
        },
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(Dash.routeName)) {
      return 0;
    }
    if (location.startsWith(Homepage.routeName)) {
      return 1;
    }
    if (location.startsWith(UploadPage.routeName)) {
      return 2;
    }
    if (location.startsWith(SinglePage.routeName)) {
      return 3;
    }
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(Dash.routeName);
        break;
      case 1:
        GoRouter.of(context).go(Homepage.routeName);
        break;
      case 2:
        GoRouter.of(context).go(UploadPage.routeName);
        break;
      case 3:
        GoRouter.of(context).go(SinglePage.routeName);
        break;
    }
  }
}