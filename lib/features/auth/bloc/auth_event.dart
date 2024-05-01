part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required this.username, required this.password});

  final String username;
  final String password;

  @override
  List<String> get props => [username, password];
}

class SaveTokenEvent extends AuthEvent {
  const SaveTokenEvent({required this.token});
  final String token;

  @override
  List<String> get props => [token];
}
