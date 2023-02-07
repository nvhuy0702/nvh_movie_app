import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nvh_movie_app/data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(Authenticated()) {
    on<SignUpEvent>(signUpRequest);
  }

  FutureOr<void> signUpRequest(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signUp(email: event.email, passWord: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
}
