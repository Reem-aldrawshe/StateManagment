import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:water_delivery/service/auth_service.dart';
import 'package:water_delivery/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final UserService _userService;

  AuthBloc(this._authService, this._userService,) : super(AuthInitial()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin); 
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.register(event.user);
      emit(AuthSuccess('Registration successful!'));
    } catch (e) {
      print('Registration Error: ${e.toString()}');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final loginData = await _userService.loginUser(event.loginUser);

      final token = loginData['access_token']; 
      final username = loginData['username'] ?? '';
      final role = loginData['role'] ?? '';

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        emit(AuthSuccess('Login successful!\nUser: $username\nRole: $role'));
      } else {
        emit(AuthFailure('Login failed: Token not found'));
      }
    } catch (e) {
      emit(AuthFailure('Login failed: ${e.toString()}'));
    }
  }
}
