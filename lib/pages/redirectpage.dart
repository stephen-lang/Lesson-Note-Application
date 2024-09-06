import 'package:flutter/material.dart';
import 'package:lessonnote/pages/Single.dart';
import 'package:lessonnote/pages/Stream_page.dart';
import 'package:lessonnote/pages/upload.dart';
 
class Redirectpage extends StatefulWidget {
  const Redirectpage({super.key});
  static String routeName = '/redirect';
  @override
  State<Redirectpage> createState() => _RedirectpageState();
}

class _RedirectpageState extends State<Redirectpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: const Text("Redirect page"),),
 body:  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Homepage()),
            );
        },
        child: Text('Stream'),
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(const Color.fromARGB(255, 10, 10, 10)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ),
    const SizedBox(
      width: 10,
    ),

//button 2
    SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SinglePage()),
            );
        },
        child: Text(
          'Single ',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ),

    // button 3
    SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UploadPage()),
            );
        },
        child: Text(
          'Upload ',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 165, 116, 116)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ),
  ],
 )
 
    );
  }
}