import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lessonnote/Constants/const.dart';
import 'package:lessonnote/routes/app_router.dart';

void main() {
   Gemini.init(
    
      apiKey: GEMINI_API_KEY, enableDebugging: true);
  runApp(const MyApp());
}

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig:AppRouter.router,
    );
  }
}
 
 
