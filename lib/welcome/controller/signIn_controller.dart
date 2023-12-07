import 'package:ecommerce/welcome/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = BlocProvider.of<SignInBloc>(context).state;
        // final state = context.read<SignInBloc>().state; // same
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty || password.isEmpty) {
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
          }
          if (credential.user!.emailVerified == false) {
            //
          }
          var user = credential.user;
          if (user != null) {
            //We got verified from user
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
