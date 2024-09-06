import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:lessonnote/pages/Single.dart';
import 'package:lessonnote/pages/Stream_page.dart';
import 'package:lessonnote/pages/redirectpage.dart';
import 'package:lessonnote/pages/upload.dart';

// Route page
class AppRoutes {
  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
            name: SinglePage.routeName, // Single Entry page
            path: SinglePage.routeName,
            pageBuilder: (_, state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: kThemeAnimationDuration,
                reverseTransitionDuration: kThemeAnimationDuration,
                child: const SinglePage(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            name: Redirectpage.routeName, // redirect page
            path: Redirectpage.routeName,
            pageBuilder: (_, state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: kThemeAnimationDuration,
                reverseTransitionDuration: kThemeAnimationDuration,
                child: const Redirectpage(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            name: UploadPage.routeName, // upload page
            path: UploadPage.routeName,
            pageBuilder: (_, state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: kThemeAnimationDuration,
                reverseTransitionDuration: kThemeAnimationDuration,
                child: const UploadPage(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            name: Homepage.routeName, //stream page
            path: Homepage.routeName,
            pageBuilder: (_, state) {
              return CustomTransitionPage<void>(
                key: state.pageKey,
                transitionDuration: kThemeAnimationDuration,
                reverseTransitionDuration: kThemeAnimationDuration,
                child: Homepage(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ), 
  ].toList(growable: false);

  //static final Streamroute = <RouteBase>[
    
  //].toList(growable: false);
}
