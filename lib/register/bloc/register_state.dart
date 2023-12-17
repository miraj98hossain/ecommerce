part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String userName;
  final String email;
  final String password;
  final bool ispasswordvisible;
  final String confirmPassword;
  const RegisterState( {this.userName="", this.email="",this.password="",this.confirmPassword="",this.ispasswordvisible=false,});

  RegisterState copywith({
  String? userName,String? email,String? password,String? confirmPassword,bool? ispasswordvisible
  }){
    return RegisterState(userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    ispasswordvisible: ispasswordvisible ?? this.ispasswordvisible);
  }


}


