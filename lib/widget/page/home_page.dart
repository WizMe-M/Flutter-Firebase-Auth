import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.email}) : super(key: key);

  final String? email;

  bool get isAnonymous => email == null;

  String get _text =>
      isAnonymous ? 'You Signed In as Anonymous' : 'Welcome $email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            _text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
