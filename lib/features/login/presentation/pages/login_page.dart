import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../contact/presentation/pages/contact_list_page.dart';
import '../bloc/remote/login_bloc.dart';
import '../bloc/remote/login_event.dart';
import '../bloc/remote/login_state.dart';

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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ContactListPage(),
              ),
            );
          }
          if (state is LoginFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.message}'),
                ),
              );
            });
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
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
                  TextButton(
                    onPressed: state is LoginLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonPressed(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }

                            if (state is LoginSuccess) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactListPage(),
                                ),
                              );
                            }

                            if (state is LoginFailure) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${state.message}'),
                                  ),
                                );
                              });
                            }
                          },
                    child: state is LoginLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
