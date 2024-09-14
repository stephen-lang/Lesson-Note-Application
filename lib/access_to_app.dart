import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessonnote/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:lessonnote/nav_bar.dart';
import 'package:lessonnote/pages/auth/blocs/sing_in_bloc/sign_in_bloc.dart';

import 'package:lessonnote/pages/intro/intromodel.dart';

class AccessToApp extends StatelessWidget {
  const AccessToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson Note App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade200,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                    context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
                // Additional Blocs can go here, if necessary
              ],
              child: const NavigationMenu(),
            );
          } else if (state.status == AuthenticationStatus.unauthenticated) {
            return const IntroView();
          } else if (state.status == AuthenticationStatus.unknown) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Always return a fallback widget for any other state (or errors)
          return const Center(
            child: Text('An unexpected error occurred.'),
          );
        },
      ),
    );
  }
}
