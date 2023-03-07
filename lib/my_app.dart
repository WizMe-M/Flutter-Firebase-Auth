import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:flutter_firebase_auth/widget/page/auth_email_link_page.dart';
import 'package:flutter_firebase_auth/widget/page/auth_email_password_page.dart';
import 'package:flutter_firebase_auth/widget/page/auth_page.dart';
import 'package:flutter_firebase_auth/widget/page/home_page.dart';
import 'package:flutter_firebase_auth/widget/page/reg_page.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: AppPage.home.path,
    routes: [
      GoRoute(
        path: AppPage.signUp.path,
        builder: (context, state) => const RegPage(),
      ),
      GoRoute(
        path: AppPage.signIn.path,
        builder: (context, state) => AuthPage(),
      ),
      GoRoute(
        path: AppPage.signInWithPassword.path,
        builder: (context, state) => const AuthEmailPasswordPage(),
      ),
      GoRoute(
        path: AppPage.signInWithLink.path,
        builder: (context, state) => const AuthEmailLinkPage(),
      ),
      GoRoute(
        path: AppPage.home.path,
        builder: (context, state) => HomePage(email: state.params['email']),
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
