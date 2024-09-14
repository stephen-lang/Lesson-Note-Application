import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lessonnote/pages/Single.dart';
import 'package:lessonnote/pages/save.dart';

import 'pages/Stream_page.dart';
import 'pages/home/dashboard.dart';

class NavigationMenu extends StatelessWidget {
  final Color colorSelect = const Color(0XFF0686F8);
  final Color color = const Color.fromARGB(255, 3, 6, 8);
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
  const NavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          surfaceTintColor: Colors.blue,
          indicatorColor: Colors.blue,
           backgroundColor:
              const Color.fromARGB(255, 225, 235, 248).withOpacity(0.21),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.chat_bubble), label: "chat"),
            NavigationDestination(
                icon: Icon(Icons.upload_file), label: "Upload"),
            NavigationDestination(
                icon: Icon(Icons.inbox_rounded), label: "Entry")
          ],
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (newIndex) {
            controller.selectedIndex.value = newIndex;
          },
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final pages = [
    const Dash(),
    Homepage(),
    const UploadPage(),
    const SinglePage(),
  ];
}
