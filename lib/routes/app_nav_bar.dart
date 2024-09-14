/*import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // Add GetStorage import
import 'package:lessonnote/pages/Single.dart';
import 'package:lessonnote/pages/Stream_page.dart';
import 'package:lessonnote/pages/home/dashboard.dart';
import 'package:lessonnote/pages/upload.dart';

final localStorage = GetStorage();

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({super.key, required Scaffold body});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}
 class NavigationController extends  GetxController{
 final Rx<int>selectedIndex=0.obs;

 final pages = [
    const Dash(),
    Homepage(),
    const UploadPage(),
    const SinglePage(),
  ];

  }

class _CustomScaffoldState extends State<CustomScaffold> {

  int index = 1; // active index of the bottom navigation bar
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color.fromARGB(255, 3, 6, 8);
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
  
  @override
  void initState() {
    super.initState();
    // If there's a previously saved index, read it from localStorage
    if (localStorage.read('index') != null) {
      index = localStorage.read('index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Scaffold(
        body:  // Use widget.body instead of widget.body
        bottomNavigationBar: BottomBarInspiredFancy(
            items: items,
            backgroundColor:
                const Color.fromARGB(255, 225, 235, 248).withOpacity(0.21),
            color: color,
            colorSelected: colorSelect,
            indexSelected: index,
            onTap: (newIndex) {
              // When an item is clicked
              setState(() {
                index = newIndex; // Update the index
                localStorage.write('index', index);
                // Save it to localStorage
              });
              // Navigate to the selected page
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => pages[index]),
                (route) => false,
              );
            }),
      ),
    );
  }

 
}


*/