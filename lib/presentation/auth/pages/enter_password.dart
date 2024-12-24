import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zapcart/common/bloc/button/button_state_cubit.dart';
import 'package:zapcart/common/helper/navigator/app_navigator.dart';
import 'package:zapcart/common/widgets/appbar/app_bar.dart';
import 'package:zapcart/common/widgets/button/basic_app_button.dart';
import 'package:zapcart/common/widgets/button/basic_reactive_button.dart';
import 'package:zapcart/data/auth/models/user_signin_req.dart';
import 'package:zapcart/domain/auth/usecases/signin.dart';
import 'package:zapcart/presentation/auth/pages/forgot_password.dart';

import '../../../common/bloc/button/button_state.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({super.key, required this.signinReq});

  final TextEditingController _passwwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if(state is ButtonSuccessState){
                
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signInText(context),
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
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return const Text(
      "Sign in",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return TextField(
      controller: _passwwordCon,
      decoration: const InputDecoration(hintText: "Enter Password"),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            signinReq.password = _passwwordCon.text;
            context.read<ButtonStateCubit>().execute(
                  usecase: SigninUseCase(),
                  params: signinReq,
                );
          },
          title: "Continue",
        );
      }
    );
  }

  Widget _forgotPasswordText(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        const TextSpan(text: "Forgot Password? "),
        TextSpan(
            text: "Reset",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPassword());
              },
            style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    ));
  }
}
