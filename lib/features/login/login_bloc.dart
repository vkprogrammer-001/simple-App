import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(
        email: event.email,
        isEmailValid: _validateEmail(event.email),
      ));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: event.password,
        isPasswordValid: _validatePassword(event.password),
      ));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, errorMessage: ''));
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      if (_validateEmail(state.email) && _validatePassword(state.password)) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(isSubmitting: false, isFailure: true, errorMessage: 'Invalid credentials'));
      }
    });
  }

  static bool _validateEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
    return emailRegex.hasMatch(email);
  }

  static bool _validatePassword(String password) {
    if (password.length < 8) return false;
    final upper = RegExp(r"[A-Z]");
    final lower = RegExp(r"[a-z]");
    final digit = RegExp(r"[0-9]");
    final symbol = RegExp(r"[^A-Za-z0-9]");
    return upper.hasMatch(password) && lower.hasMatch(password) && digit.hasMatch(password) && symbol.hasMatch(password);
  }
}
