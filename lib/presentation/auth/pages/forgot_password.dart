import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zapcart/common/helper/navigator/app_navigator.dart';
import 'package:zapcart/common/widgets/appbar/app_bar.dart';
import 'package:zapcart/common/widgets/button/basic_app_button.dart';
import 'package:zapcart/presentation/auth/pages/enter_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _forgotPasswordText(context),
            const SizedBox(
              height: 20,
            ),
            _emailTextField(context),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return const Text(
      "Forgot Password",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Enter Email address"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: "Continue",
    );
  }

  
}
