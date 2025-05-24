import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';


part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<UserSaved>((event, emit) {
      emit(UserAuthorized());
      // ? Save the State in Local Storage 
      // ! Use : 1_Shared Prefencees
      // ! Use : 2_Hydrated Bloc
    
    });
  }
}
