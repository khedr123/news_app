import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/view/verification.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';

import 'features/auth/presentation/view/login.dart';
import 'features/auth/presentation/view/register.dart';
import 'features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: ( context) =>AuthCubit(),
      child: LoginView()),
    );
  }
}
