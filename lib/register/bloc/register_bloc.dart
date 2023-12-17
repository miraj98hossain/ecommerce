import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {
      on<UserNameEvent>((event, emit) => _userNameEvent(event, emit));
      on<EmailEvent>((event, emit) => _emailEvent(event, emit));
      on<PasswordEvent>((event, emit) => _passwordEvent(event, emit));
      on<ConfirmPasswordEvent>((event, emit) => _confirmPasswordEvent(event, emit));
      on<PasswordVisibleEvent>((event, emit) => _passwordVisibleEvent(event,emit));
      
    });
    
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
         print("Username is ${event.userName}");
        emit(state.copywith(
          userName: event.userName,
          email: state.email,
          password: state.password,
          confirmPassword: state.confirmPassword
        ));
      }
      void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
        print("Email is ${event.email}");
        emit(state.copywith(
          userName: state.userName,
          email: event.email,
          password: state.password,
          confirmPassword: state.confirmPassword
        ));
      }
      void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
        print("Password is ${event.password}");
        emit(state.copywith(
          userName: state.userName,
          email: state.email,
          password: event.password,
          confirmPassword: state.confirmPassword
        ));
      }
      void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<RegisterState> emit) {
        print("Confirm Password is ${event.confirmPassword}");
        emit(state.copywith(
          userName: state.userName,
          email: state.email,
          password: state.password,
          confirmPassword: event.confirmPassword
        ));
      }
      void _passwordVisibleEvent(PasswordVisibleEvent event, Emitter<RegisterState> emit) {
        emit(state.copywith(
          userName: state.userName,
          email: state.email,
          password: state.password,
          confirmPassword: state.confirmPassword,
          ispasswordvisible: event.passwordVisible
        ));
      }
}
