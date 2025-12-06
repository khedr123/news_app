import 'package:flutter/material.dart';

import '../utilises/colors/colors.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({super.key, required this.suffixIcon, required this.title, required this.controller});
final IconButton suffixIcon;
final String title;
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      controller: controller,

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
