import 'package:equatable/equatable.dart';
import 'package:water_delivery/model/auth_model.dart';
import 'package:water_delivery/model/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterEvent extends AuthEvent {
  final AuthModel user;

  RegisterEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginEvent extends AuthEvent {
  final LoginModel loginUser;

  LoginEvent(this.loginUser);

  @override
  List<Object?> get props => [loginUser];
}
