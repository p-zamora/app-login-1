// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_new

part of 'login_bloc.dart';

@immutable
class LoginState {
  final String? email;
  final String? password;
  final bool isInvalidEmail;
  final bool isInvalidPassword;
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final String? errorMessage;

  LoginState({
    this.email, 
    this.password,
    this.isInvalidEmail     = false,
    this.isInvalidPassword  = false,
    this.isLoading          = false,
    this.isSuccess          = false,
    this.isFailure          = false,
    this.errorMessage
  });

   LoginState copyWith({
    String? email,
    String? password,
    bool? isInvalidEmail,
    bool? isInvalidPassword,
    bool? isLoading,
    bool? isFailure,
    bool? isSuccess,
    String? errorMessage
  }) => new LoginState(
    email             : email             ?? this.email,
    password          : password          ?? this.password,
    isInvalidEmail    : isInvalidEmail    ?? this.isInvalidEmail,
    isInvalidPassword : isInvalidPassword ?? this.isInvalidPassword,
    isLoading         : isLoading         ?? this.isLoading,
    isFailure         : isFailure         ?? this.isFailure,
    isSuccess         : isSuccess         ?? this.isSuccess,
    errorMessage      : errorMessage      ?? this.errorMessage
  );



}

