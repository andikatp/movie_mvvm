import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mvvm/features/settings/repository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required SettingsRepository repository})
      : _repository = repository,
        super(const SettingsLoading()) {
    on<SettingsEvent>((event, emit) => emit(const SettingsLoading()));
    on<LogoutEvent>(_logoutHandler);
  }

  final SettingsRepository _repository;

  Future<void> _logoutHandler(
    LogoutEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await _repository.logout();
    result.fold(
      (failure) => emit(LogOutError(message: failure.errorMessage)),
      (_) => emit(const LoggedOut()),
    );
  }
}
