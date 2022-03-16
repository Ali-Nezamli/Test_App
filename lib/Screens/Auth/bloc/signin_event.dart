part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class UserSignInEvent extends SigninEvent {
  final String userEmail;
  final String userPassword;

  UserSignInEvent({required this.userEmail, required this.userPassword});
}
