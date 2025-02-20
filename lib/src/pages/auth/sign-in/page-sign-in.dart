import 'package:flutter/material.dart';
import 'package:funilaria_facil/src/data/repository/firebase-auth.dart';
import 'package:funilaria_facil/src/pages/auth/forget-password/page-forget-password.dart';
import 'package:funilaria_facil/src/pages/auth/sign-up/page-sign-up.dart';
import 'package:get/get.dart';


class PageSignIn extends StatefulWidget {
  const PageSignIn({super.key});

  @override
  State<PageSignIn> createState() => _PageSignInState();
}

class _PageSignInState extends State<PageSignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Image.asset('lib/assets/logo-app.png'),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await FireAuth.signInUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to registration page
                      Get.to(() => const PageSignUp());
                    },
                    child: const Text('Cadastrar'),
                  ),
                  TextButton(
                    onPressed: () {
                     Get.to(() => const PageResetPassword());
                    },
                    child: const Text('Esqueci a senha'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
