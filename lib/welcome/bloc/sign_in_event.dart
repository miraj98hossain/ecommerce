part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInEmailEvent extends SignInEvent {
  final String email;

  SignInEmailEvent({required this.email});
}

class SignInPasswordEvent extends SignInEvent {
  final String password;

  SignInPasswordEvent({required this.password});
}

class SignInPasswordVisibleEvent extends SignInEvent {
  final bool passwordVisible;

  SignInPasswordVisibleEvent({required this.passwordVisible});
}

class SignInLoginButtonEvent extends SignInEvent {
  final String email;
  final String password;

  SignInLoginButtonEvent({required this.email, required this.password});
}

class SignInRegisterButtonEvent extends SignInEvent {}
