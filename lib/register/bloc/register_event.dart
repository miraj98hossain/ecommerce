part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}
class UserNameEvent extends RegisterEvent{
  final String userName;

  UserNameEvent({required this.userName});

}
class EmailEvent extends RegisterEvent{
  final String email;
  EmailEvent({required this.email});
}
class PasswordEvent extends RegisterEvent{
  final String password;
  PasswordEvent({required this.password});
}
class PasswordVisibleEvent extends RegisterEvent{
  final bool passwordVisible;
  PasswordVisibleEvent({required this.passwordVisible});
}
class ConfirmPasswordEvent extends RegisterEvent{
  final String confirmPassword;
  ConfirmPasswordEvent({required this.confirmPassword});
}
class RegisterButtonEvent extends RegisterEvent{}
