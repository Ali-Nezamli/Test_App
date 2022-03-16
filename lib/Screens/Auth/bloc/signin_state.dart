part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class Loading extends SigninState {}

class SigninSuccess extends SigninState {}

class SignInUnauthorized extends SigninState {}

class Error extends SigninState {
  final String exception;

  Error(this.exception);
}
