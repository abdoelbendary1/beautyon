import 'package:beautyon/Core/Utils/Routing/app_routes.dart';
import 'package:beautyon/Data/model/loginDataModel.dart';
import 'package:beautyon/Data/model/signUpRequest.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final loginFormState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(
      {required LoginRequest loginRequest, required BuildContext context}) {
    if (loginFormState.currentState!.validate()) {
      // Form is valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is valid! Submitting...'),
        ),
      );
    }
  }

  final signUpFormState = GlobalKey<FormState>();
  final signUpEmailController = TextEditingController();
  final signUpUsernameController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpPhoneController = TextEditingController();

  void signUp(
      {required SignUpRequest signUpRequest, required BuildContext context}) {
    if (signUpFormState.currentState!.validate()) {
      navigateToAccCreated(context);
    }
  }

  void navigateToSignInScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signIn);
  }

  void navigateToAccCreated(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.accCreated);
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.signUp);
  }

  void navigateToForgotPass(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.forgotPass);
  }

  void navigateToMainApp(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.mainScreen,
      (route) => false,
    );
  }
}
