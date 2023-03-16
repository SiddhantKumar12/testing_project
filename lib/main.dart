import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/logic/otp/otp_cubit.dart';
import 'package:testing_project/presentation/login_page.dart';
import 'logic/auth/auth_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(),
          ),
          BlocProvider(
            create: (_) => OtpCubit(),
          ),
        ],
        child: LoginPage(),
      ),
    );
  }
}
