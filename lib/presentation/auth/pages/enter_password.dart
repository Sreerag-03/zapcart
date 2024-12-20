import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zapcart/common/helper/navigator/app_navigator.dart';
import 'package:zapcart/common/widgets/appbar/app_bar.dart';
import 'package:zapcart/common/widgets/button/basic_app_button.dart';
import 'package:zapcart/presentation/auth/pages/forgot_password.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _signInText(context),
          const SizedBox(height: 20,),
          _passwordTextField(context),
          const SizedBox(height: 20,),
          _continueButton(context),
          const SizedBox(height: 20,),
          _forgotPasswordText(context),
        ],
      ),
      ),
    );
  }

  Widget _signInText(BuildContext context){
  return const Text(
    "Sign in",
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,

    ),
  );
}

Widget _passwordTextField(BuildContext context){
  return const TextField(
    decoration: InputDecoration(
      hintText: "Enter Password"
    ),
  );
}

Widget _continueButton(BuildContext context){
  return BasicAppButton(onPressed:(){} ,title: "Continue",);
}

Widget _forgotPasswordText(BuildContext context){
  return RichText(text:  TextSpan(
    children: [
      const TextSpan(
        text: "Forgot Password? "
      ),
      TextSpan(
        text: "Reset",
        recognizer: TapGestureRecognizer()..onTap = (){
          AppNavigator.push(context, ForgotPassword());
        },
        style: const TextStyle(fontWeight: FontWeight.bold)
      )
    ],
  ));
}
}

