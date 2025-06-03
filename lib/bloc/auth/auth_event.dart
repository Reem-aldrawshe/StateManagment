abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
  });
}


// import 'package:equatable/equatable.dart';

// abstract class AuthEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// // تسجيل جديد
// class RegisterEvent extends AuthEvent {
//   final String email;
//   final String username;
//   final String role;
//   final String password;

//   RegisterEvent({
//     required this.email,
//     required this.username,
//     required this.role,
//     required this.password,
//   });

//   @override
//   List<Object> get props => [email, username, role, password];
// }

// // تسجيل دخول
// class LoginEvent extends AuthEvent {
//   final String email;
//   final String password;

//   LoginEvent({required this.email, required this.password});

//   @override
//   List<Object> get props => [email, password];
// }
