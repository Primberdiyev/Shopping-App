import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/features/auth/models/user_model.dart';
import 'package:shopping_app/features/auth/repositories/auth_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<SignUpUser>(_onSignUpUser);
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
}
