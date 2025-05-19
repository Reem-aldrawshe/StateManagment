// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class TryLogIn extends LoginEvent {
  final UserModel user;
  TryLogIn({
    required this.user,
  });
}
