import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/shared_widgets/appbar.dart';
import 'package:news_app/features/auth/presentation/cubit/login_cubit/login_state.dart';
import 'package:news_app/features/home/presentation/view/home_view.dart';

import '../../../../core/shared_widgets/app_button.dart';
import '../../../../core/shared_widgets/custom_input_widget.dart';
import '../../../../core/utilises/colors/colors.dart';
import '../../../../core/utilises/helper_methods/validator.dart';
import '../cubit/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final Dio dio = Dio();
  final _formkey = GlobalKey<FormState>();
  bool isVisable = false;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Login'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formkey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign in to catch up on the\n latest news.',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.fillColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                CustomInputWidget(
                  validator: (value) {
                    return Validator.validateEmail(value!);
                  },
                  controller: emailController,
                  title: 'Email',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.email),
                  ),
                  obscureText: false,
                ),
                SizedBox(height: 20),
                CustomInputWidget(
                  validator: (value) {
                    return Validator.validatePassword(value!);
                  },
                  controller: passwordController,
                  title: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Loading...'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failure'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is LoginSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      }
                    },
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return AppButton(
                          title: 'Login',
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              log(
                                'validate with email :${emailController.text},password:${passwordController.text}',
                              );

                              await BlocProvider.of<AuthCubit>(context)
                                  .login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((_) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeView(),
                                      ),
                                    );
                                  })
                                  .catchError((error) {
                                    log('Login Failed: $error');
                                  });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register Now',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
