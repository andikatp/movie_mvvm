part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class LoggedIn extends AuthState {
  const LoggedIn();
}

final class TokenSaved extends AuthState {
  const TokenSaved();
}

final class AuthError extends AuthState {
  const AuthError({required this.message});
  final String message;

  @override
  List<String> get props => [message];
}
