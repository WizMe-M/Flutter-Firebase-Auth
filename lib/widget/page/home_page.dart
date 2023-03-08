import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String _text;

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      context.go(AppPage.signIn.path);
    }
  }

  @override
  void initState() {
    super.initState();

    var user = FirebaseAuth.instance.currentUser!;
    if (user.isAnonymous) {
      _text = 'You signed in Anonymously';
      return;
    }

    _text = 'Welcome ${user.email}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => signOut(context),
                child: const Text('Sign Out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
