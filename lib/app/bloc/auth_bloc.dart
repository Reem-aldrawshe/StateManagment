import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ✅ ضروري

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UserSaved>(onUserSaved);
    //emit(UserAuthorized());
    on<CheckUserAuthStatus>(onCheckUserAuthStatus);

    // ? Save the State in Local Storage
    // ! Use : 1_Shared Prefencees
    // ! Use : 2_Hydrated Bloc
  }

  Future<void> onUserSaved(UserSaved event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("is_logged_in", true);
    emit(UserAuthorized());
  }

  Future<void> onCheckUserAuthStatus(
      CheckUserAuthStatus event, Emitter<AuthState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool("is_logged_in") ?? false;
    if (isLoggedIn) {
      emit(UserAuthorized());
    } else {
      emit(UserUnauthorized());
    }
  }
}
