// ignore_for_file: unnecessary_new, prefer_const_constructors_in_immutables

part of 'registrar_bloc.dart';

@immutable
class RegistrarState {
final String? user;
final String? email;
final String? phone;
final String? password;
  final bool isInvalidUser;
  final bool isInvalidEmail;
  final bool isInvalidPhone;
  final bool isInvalidPassword;
  final bool isLoading;
  final bool isFailure;
  final bool isSuccess;
  final String? errorMessage;

  RegistrarState({
    this.user,
    this.email,
    this.phone,
    this.password,
    this.isInvalidUser      = false,
    this.isInvalidEmail     = false,
    this.isInvalidPhone     = false,
    this.isInvalidPassword  = false,
    this.isLoading          = false,
    this.isSuccess          = false,
    this.isFailure          = false,
    this.errorMessage
  });

   RegistrarState copyWith({
    String? user,
    String? email,
    String? phone,
    String? password,
    bool? isInvalidUser,
    bool? isInvalidEmail,
    bool? isInvalidPhone,
    bool? isInvalidPassword,
    bool? isLoading,
    bool? isFailure,
    bool? isSuccess,
    String? errorMessage
  }) => new RegistrarState(
    user              : user              ?? this.user,
    email             : email             ?? this.email,
    phone             : phone             ?? this.phone,
    password          : password          ?? this.password,
    isInvalidUser     : isInvalidUser     ?? this.isInvalidUser,
    isInvalidEmail    : isInvalidEmail    ?? this.isInvalidEmail,
    isInvalidPhone    : isInvalidPhone    ?? this.isInvalidPhone,
    isInvalidPassword : isInvalidPassword ?? this.isInvalidPassword,

    isLoading         : isLoading         ?? this.isLoading,
    isFailure         : isFailure         ?? this.isFailure,
    isSuccess         : isSuccess         ?? this.isSuccess,
    errorMessage      : errorMessage      ?? this.errorMessage
  );



}

