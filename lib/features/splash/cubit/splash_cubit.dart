import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mvvm/features/splash/repository/splash_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required SplashRepository repository})
      : _repository = repository,
        super(const SplashInitial());
  final SplashRepository _repository;

  Future<void> checkUserLoggedIn() async {
    emit(const SplashLoading());
    final result = await _repository.checkUserLoggedIn();
    result.fold(
      (failure) => emit(SplashError(message: failure.errorMessage)),
      (isUserLoggedIn) =>
          emit(SplashUserChecked(isUserLoggedIn: isUserLoggedIn)),
    );
  }
}
