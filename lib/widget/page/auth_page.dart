import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:flutter_firebase_auth/widget/util/dynamic_auth_widget.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordHidden = true;

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  void signIn() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    var uc = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    debugPrint('auth. #is log in = ${uc.user != null}');

    if (context.mounted) {
      context.go(AppPage.home.path);
    }
  }

  void signInAnon() async {
    var uc = await FirebaseAuth.instance.signInAnonymously();

    debugPrint('auth. #is log in = ${uc.user != null}');

    if (context.mounted) {
      context.go(AppPage.home.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DynamicInputWidget(
                controller: _emailController,
                prefixIcon: Icons.email,
                labelText: 'Email',
                textInputAction: TextInputAction.next,
              ),
              DynamicInputWidget(
                controller: _passwordController,
                labelText: 'Password',
                prefixIcon: Icons.password,
                isPasswordField: true,
                obscureText: isPasswordHidden,
                toggleObscureCallback: togglePassword,
                textInputAction: TextInputAction.done,
              ),
              ElevatedButton(
                  onPressed: () => signIn(),
                  child: const Text('Sign In with Password')),
              ElevatedButton(
                  onPressed: () => signInAnon(),
                  child: const Text('Sign In anonymously')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  TextButton(
                      onPressed: () => context.go(AppPage.signUp.path),
                      child: const Text('Register'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
