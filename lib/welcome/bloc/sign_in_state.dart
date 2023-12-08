part of 'sign_in_bloc.dart';

class SignInState {
  final String email;
  final String password;
  final bool passwordVisible;

  SignInState(
      {this.email = "", this.password = "", this.passwordVisible = false});
  SignInState copyWith(
      {String? email, String? password, bool? passwordVisible}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordVisible: passwordVisible ?? this.passwordVisible);
  }
}
