import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mvvm/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository repository,
  })  : _repository = repository,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(const AuthLoading()));
    on<LoginEvent>(_loginHandler);
    on<SaveTokenEvent>(_saveTokenHandler);
  }

  final AuthRepository _repository;

  Future<void> _loginHandler(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _repository.login(
      username: event.username,
      password: event.password,
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(const LoggedIn()),
    );
  }

  Future<void> _saveTokenHandler(
    SaveTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _repository.saveToken(token: event.token);
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(const TokenSaved()),
    );
  }
}
