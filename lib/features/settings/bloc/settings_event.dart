part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LogoutEvent extends SettingsEvent {
  const LogoutEvent();
}
