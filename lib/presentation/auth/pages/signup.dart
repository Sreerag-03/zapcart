import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zapcart/common/helper/navigator/app_navigator.dart';
import 'package:zapcart/common/widgets/appbar/app_bar.dart';
import 'package:zapcart/common/widgets/button/basic_app_button.dart';
import 'package:zapcart/data/auth/models/user_creation_req.dart';
import 'package:zapcart/presentation/auth/pages/forgot_password.dart';
import 'package:zapcart/presentation/auth/pages/gender_and_age_selection.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createAccountText(context),
            const SizedBox(
              height: 20,
            ),
            _firstNameTextField(context),
            const SizedBox(
              height: 20,
            ),
            _lastNameTextField(context),
            const SizedBox(
              height: 20,
            ),
            _emailTextField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordTextField(context),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _forgotPasswordText(context),
          ],
        ),
      ),
    );
  }

  Widget _createAccountText(BuildContext context) {
    return const Text(
      "Create Account",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Email Address"),
    );
  }

  Widget _firstNameTextField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Firstname"),
    );
  }

  Widget _lastNameTextField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Lastname"),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(hintText: "Password"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameCon.text,
              email: _emailCon.text, 
              lastName: _lastNameCon.text,
              password: _passwordCon.text
            ),
          )
        );
      },
      title: "Continue",
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        const TextSpan(text: "Forgot Password? "),
        TextSpan(
            text: "Reset",
            recognizer: TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context,const ForgotPassword());
            },
            style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    ));
  }
}
