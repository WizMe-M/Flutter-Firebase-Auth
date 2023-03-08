import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:flutter_firebase_auth/widget/util/dynamic_auth_widget.dart';
import 'package:go_router/go_router.dart';

class AuthEmailPasswordPage extends StatefulWidget {
  const AuthEmailPasswordPage({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  State<AuthEmailPasswordPage> createState() => _AuthEmailPasswordPageState();
}

class _AuthEmailPasswordPageState extends State<AuthEmailPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.email),
            DynamicInputWidget(
              controller: _passwordController,
              labelText: 'Password',
              prefixIcon: Icons.password,
              isPasswordField: true,
              obscureText: isPasswordHidden,
              toggleObscureCallback: togglePassword,
              textInputAction: TextInputAction.done,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
            ElevatedButton(
                onPressed: () => context.go(AppPage.signIn.path),
                child: const Text('Back')),
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }
}
