import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/routing/app_path.dart';
import 'package:flutter_firebase_auth/widget/util/dynamic_auth_widget.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              height: 300,
              width: 400,
              child: Column(
                children: [
                  Expanded(
                    child: DynamicInputWidget(
                      controller: _emailController,
                      prefixIcon: Icons.email,
                      labelText: 'Email',
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In with Password')),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In with Link')),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In anonymously')),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account yet?"),
                        TextButton(
                            onPressed: () => context.go(AppPage.signUp.path),
                            child: const Text('Register'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
