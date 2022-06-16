part of 'registrar_bloc.dart';

@immutable
abstract class RegistrarEvent {}

class OnSubmit extends RegistrarEvent {
  
}

class OnChangeUser extends RegistrarEvent {
  final String user;

  OnChangeUser(this.user);
}

class OnChangeEmail extends RegistrarEvent {
  final String email;

  OnChangeEmail(this.email);
}

class OnChangePhone extends RegistrarEvent {
  final String phone;

  OnChangePhone(this.phone);
}

class OnChangePassword extends RegistrarEvent {
  final String password;

  OnChangePassword(this.password);
}