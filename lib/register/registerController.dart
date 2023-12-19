import 'package:ecommerce/common/widgets/toast.dart';
import 'package:ecommerce/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});
  Future<void> handleRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (userName.isEmpty) {
      toastInfo(msg: "Username is empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email is empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password is empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm Password is empty");
      return;
    }
    if (password != confirmPassword) {
      toastInfo(msg: "Password and Confirm Password does not match");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An Email has been sent to ${credential.user?.email}");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      toastInfo(msg: e.toString());
    }
  }
}
