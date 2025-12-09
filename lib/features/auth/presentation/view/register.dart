import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/app_button.dart';
import 'package:news_app/core/shared_widgets/appbar.dart';

import '../../../../core/shared_widgets/custom_input_widget.dart';
import '../../../../core/utilises/colors/colors.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final Dio dio = Dio();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    final Response response = await dio.post(
      'https://accessories-eshop.runasp.net/api/auth/register',
      data: {
        "email": emailController.text,
        "password": passwordController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
      },
    );
    log(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: 'Register'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Your Account',
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
                controller: firstNameController,
                title: 'First Name',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              CustomInputWidget(
                controller: lastNameController,
                title: 'Last Name',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              CustomInputWidget(
                controller: emailController,
                title: 'Email',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),

              CustomInputWidget(
                controller: passwordController,
                title: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: AppButton(
                  title: 'Register',
                  onPressed: () {
                    signup();
                  },
                ),
              ),

              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login Now',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
