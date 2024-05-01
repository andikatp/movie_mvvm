part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

class LoggedOut extends SettingsState {
  const LoggedOut();
}

class LogOutError extends SettingsState {
  const LogOutError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];

}
