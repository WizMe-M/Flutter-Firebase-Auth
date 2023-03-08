import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:flutter_firebase_auth/widget/page/auth_page.dart';
import 'package:flutter_firebase_auth/widget/page/home_page.dart';
import 'package:flutter_firebase_auth/widget/page/reg_page.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: AppPage.signIn.path,
    routes: [
      GoRoute(
        path: AppPage.signUp.path,
        builder: (context, state) => const RegPage(),
      ),
      GoRoute(
        path: AppPage.signIn.path,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: AppPage.home.path,
        builder: (context, state) => HomePage(
          email: state.queryParams['email'],
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
