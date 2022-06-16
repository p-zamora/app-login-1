part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnSubmit extends LoginEvent {
  
}

class OnChangeEmail extends LoginEvent {
  final String email;

  OnChangeEmail(this.email);
}

class OnChangePassword extends LoginEvent {
  final String password;

  OnChangePassword(this.password);
}