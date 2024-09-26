import 'package:contact_list/features/login/presentation/bloc/remote/login_bloc.dart';
import 'package:contact_list/features/login/presentation/bloc/remote/login_event.dart';
import 'package:contact_list/features/login/presentation/bloc/remote/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          var loginButton;
          if (state is LoginLoading) {
            loginButton = const CircularProgressIndicator();
          } else {
            loginButton = TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginButtonPressed(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
              child: const Text('Login'),
            );
          }

          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                loginButton,
              ],
            ),
          );
        },
      ),
    );
  }
}
