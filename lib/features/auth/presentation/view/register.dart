import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/appbar.dart';

import '../../../../core/shared_widgets/custom_input_widget.dart';
import '../../../../core/utilises/colors/colors.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              CustomInputWidget(
                controller: lastNameController,
                title: 'Last Name',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.email),
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
