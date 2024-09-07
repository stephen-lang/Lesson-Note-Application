import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lessonnote/Constants/const.dart';
import 'package:lessonnote/app.dart';
import 'package:lessonnote/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';
 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
Bloc.observer =   SimpleBlocObserver();
   Gemini.init(
    
      apiKey: GEMINI_API_KEY, enableDebugging: true);
  runApp(MyApp(FirebaseUserRepo())); // create an instance of firebase repo
}
 
