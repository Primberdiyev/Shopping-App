part of 'authentication_bloc.dart';

//@immutable
sealed class AuthenticationEvent {}

class SignUpUser extends AuthenticationEvent {
  SignUpUser(this.userModel);

  final UserModel userModel;
}

class CheckEmail extends AuthenticationEvent {
  CheckEmail(this.email);

  final String email;
}

class SignInUser extends AuthenticationEvent {
  SignInUser({required this.email, required this.password});

  String password;
  String email;
}
