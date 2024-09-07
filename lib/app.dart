import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessonnote/routes/app_router.dart';
import 'package:user_repository/user_repository.dart';

import 'blocs/authentication_bloc/authentication_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Lesson Note App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 91, 115, 182)),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router, // Assuming `AppRouter` is the GoRouter setup
      ),
    );
  }
}