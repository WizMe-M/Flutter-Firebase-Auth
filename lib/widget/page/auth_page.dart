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

  void onSignInFailed(dynamic error) async {
    var alert = AlertDialog(
      title: const Text('Authentication failed'),
      content: Text(error.toString()),
    );

    await showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void signIn() async {
    var email = _emailController.text;
    var password = _passwordController.text;

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (context.mounted) {
        context.go(AppPage.home.path);
      }
    } on FirebaseAuthException catch (e) {
      onSignInFailed(e.message);
    }
  }

  void signInAnon() async {
    await FirebaseAuth.instance.signInAnonymously();

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: DynamicInputWidget(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DynamicInputWidget(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.password,
                  isPasswordField: true,
                  obscureText: isPasswordHidden,
                  toggleObscureCallback: togglePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => signIn(),
                    child: const Text('Sign In with Password'),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () => signInAnon(),
                    child: const Text('Sign In anonymously')),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account yet?"),
                  TextButton(
                    onPressed: () => context.go(AppPage.signUp.path),
                    child: const Text('Register'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
