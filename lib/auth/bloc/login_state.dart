part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Loading extends LoginState {

}

class SuccessToLogin extends LoginState {}

class FailedToLogin extends LoginState {}