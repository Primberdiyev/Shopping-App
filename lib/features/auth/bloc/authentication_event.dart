part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class SignUpUser extends AuthenticationEvent {
  SignUpUser(this.userModel);

  final UserModel userModel;
}
