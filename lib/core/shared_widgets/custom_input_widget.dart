import 'package:flutter/material.dart';

import '../utilises/colors/colors.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    required this.suffixIcon,
    required this.title,
    required this.controller,
    this.validator, required this.obscureText,
  });
  final bool obscureText;
  final IconButton suffixIcon;
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(

        suffixIcon: suffixIcon,
        hintText: title,
        filled: true,
        fillColor: AppColors.fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
