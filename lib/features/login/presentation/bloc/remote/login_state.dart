import '../../../domain/entities/user.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;

  LoginSuccess({required this.user});
}

class LoginFailure extends LoginState {
  final Object? message;

  LoginFailure({required this.message});
}