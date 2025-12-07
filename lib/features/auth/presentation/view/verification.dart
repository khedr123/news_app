import 'package:flutter/material.dart';
import 'package:news_app/core/shared_widgets/app_button.dart';
import 'package:news_app/core/shared_widgets/appbar.dart';
import 'package:pinput/pinput.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Verification'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify your account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'A verification link has been sent to your email.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Pinput(length: 5),
            const SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: AppButton(title: 'Verify', onPressed: () {}),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Didn't Receive any code?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: Text('Resend')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
