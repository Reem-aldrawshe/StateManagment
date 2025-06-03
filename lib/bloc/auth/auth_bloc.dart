import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_delivery/bloc/auth/auth_event.dart';
import 'package:water_delivery/bloc/auth/auth_state.dart';
import 'package:water_delivery/service/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    // تسجيل الدخول
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final success = await authService.login(event.email, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(message: 'فشل تسجيل الدخول'));
      }
    });

    // التسجيل
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final success = await authService.register(
        event.username,
        event.email,
        event.password,
      );
      if (success) {
        emit(AuthRegistered());
      } else {
        emit(AuthFailure(message: 'فشل إنشاء الحساب'));
      }
    });
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:water_delivery/model/login_model.dart';
// import 'package:water_delivery/service/auth_service.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthService authService;

//   AuthBloc({required this.authService}) : super(AuthInitial()) {
//     // تسجيل جديد
//     on<RegisterEvent>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         final model = AuthModel(
//           email: event.email,
//           username: event.username,
//           role: event.role,
//           password: event.password,
//         );
//         await authService.register(model);
//         emit(AuthSuccess(message: "Account created successfully"));
//       } catch (e) {
//         emit(AuthFailure(message: "Registration failed: ${e.toString()}"));
//       }
//     });

//     // تسجيل دخول (مؤقتًا بنخليها فارغة، نكمل لاحقًا)
//     on<LoginEvent>((event, emit) async {
//       emit(AuthLoading());
//       await Future.delayed(Duration(seconds: 1));
//       emit(AuthFailure(message: 'Login not yet implemented'));
//     });
//   }
// }
