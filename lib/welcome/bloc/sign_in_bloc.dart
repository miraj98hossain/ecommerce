//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/common/widgets/toast.dart';
import 'package:ecommerce/welcome/bloc/sign_in_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInEmailEvent>((event, emit) {
      print("Email is ${event.email}");
      emit(state.copyWith(
        email: event.email,
      ));
    });
    on<SignInPasswordEvent>((event, emit) {
      print("Password is ${event.password}");
      emit(state.copyWith(password: event.password));
    });
    on<SignInPasswordVisibleEvent>(
      (event, emit) =>
          emit(state.copyWith(passwordVisible: event.passwordVisible)),
    );
    on<SignInLoginButtonEvent>(
      (event, emit) async {
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {
          toastInfo(msg: "Email is empty");
          return;
        } else if (password.isEmpty) {
          toastInfo(msg: "Password is empty");
          return;
        } else {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);

            if (credential.user == null) {
              toastInfo(msg: "User Not Found");
              return;
            }
            if (credential.user!.emailVerified == false) {
              toastInfo(msg: "Email Not Verified");
              return;
            }
            var user = credential.user;
            if (user != null) {
              toastInfo(msg: "Login Successful");
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              toastInfo(msg: "User Not Found");
              return;
            } else if (e.code == 'wrong-password') {
              toastInfo(msg: "Wrong password provided for that user.");
              return;
            } else if (e.code == 'invalid-email') {
              toastInfo(msg: "Invalid email provided for that user.");
              return;
            }
          }
        }
      },
    );
  }
}
