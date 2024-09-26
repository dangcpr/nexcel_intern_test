import 'package:contact_list/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/contact/presentation/bloc/get_contact_list_bloc.dart';
import 'features/login/presentation/bloc/remote/login_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<LoginBloc>()),
      BlocProvider(create: (context) => getIt<GetContactListBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
