//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEmailEvent>((event, emit) {
      // print("Email is ${event.email}");
      emit(state.copyWith(email: event.email));
    });
    on<SignInPasswordEvent>((event, emit) {
      // print("Email is ${event.password}");
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

        // if (email.isEmpty || password.isEmpty) {
        //   // print("Please enter email and password");
        //   emit(SignInError(error: "Please enter email and password"));
        // }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          // print("I am Here");
          if (credential.user == null) {
            // print("User Not Found");
            emit(SignInError(error: "User Not Found"));
          }
          if (credential.user!.emailVerified == false) {
            // print("Email Not Verified");
            emit(SignInError(error: "Email Not Verified"));
          }
          var user = credential.user;
          if (user != null) {
            print("User Found: ${user.email}");
            //emit(SignInSuccess());
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("User Not Found");
            emit(SignInError(error: "User Not Found"));
          } else if (e.code == 'wrong-password') {
            print("Wrong Password");
            emit(SignInError(error: "Wrong Password"));
          } else if (e.code == 'invalid-email') {
            print("Invalid Email");
            emit(SignInError(error: "Invalid Email"));
          }
        }
      },
    );
  }
}
