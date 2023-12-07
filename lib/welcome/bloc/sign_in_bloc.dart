import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState(email: "", password: "")) {
    on<SignInEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<SignInPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
