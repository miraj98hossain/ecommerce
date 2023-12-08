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

class SignInInitial extends SignInState {
  SignInInitial({
    String email = "",
    String password = "",
    bool passwordVisible = false,
  }) : super(
            email: email, password: password, passwordVisible: passwordVisible);
}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInError extends SignInState {
  final String error;
  SignInError({required this.error});
}
