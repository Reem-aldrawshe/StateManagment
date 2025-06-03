// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:water_delivery/service/auth_service.dart';
// import 'login_event.dart';
// import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthService authService;

//   LoginBloc({required this.authService}) : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       emit(LoginLoading());

//       try {
//         final auth = await authService.login(event.email, event.password);
//         // احفظ التوكن مثلاً باستخدام SharedPreferences
//         emit(LoginSuccess());
//       } catch (e) {
//         emit(LoginFailure(message: e.toString()));
//       }
//     });
//   }
// }
