import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/features/auth/models/user_model.dart';
import 'package:shopping_app/features/auth/repositories/auth_repository.dart';
import 'package:shopping_app/features/utils/app_texts.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<SignUpUser>(_onSignUpUser);
    on<CheckEmail>(_checkEmail);
    on<SignInUser>(_signIn);
  }

  Future<void> _onSignUpUser(
    SignUpUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    try {
      await AuthRepository().signUp(event.userModel);

      emit(AuthenticationSuccess());
    } catch (e) {
      log('error $e');
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void _checkEmail(CheckEmail event, Emitter<AuthenticationState> emit) {
    final isValid = AuthRepository().isValidEmailProvider(event.email);

    if (isValid) {
      emit(AuthenticationSuccess());
    } else {
      emit(
        AuthenticationFailure(AppTexts.invalidEmail),
      );
    }
  }

  void _signIn(SignInUser event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await AuthRepository()
          .signIn(email: event.email, password: event.password);
      emit(AuthenticationSuccess());
    } catch (e) {
      log('error $e');
      emit(AuthenticationFailure(e.toString()));
    }
  }
}
