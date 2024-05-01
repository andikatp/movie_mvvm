import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mvvm/features/detail/models/detail.dart';
import 'package:movie_mvvm/features/detail/repository/detail_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required DetailRepository repository})
      : _repository = repository,
        super(const DetailInitial()) {
    on<DetailEvent>((event, emit) => emit(const DetailLoading()));
    on<GetMovieDetailEvent>(_getMovieDetailHandler);
  }

  final DetailRepository _repository;

  Future<void> _getMovieDetailHandler(
    GetMovieDetailEvent event,
    Emitter<DetailState> emit,
  ) async {
    final result = await _repository.getMovieDetail(event.imdbID);
    result.fold(
      (failure) => emit(DetailError(message: failure.errorMessage)),
      (detail) => emit(DetailLoaded(movieDetail: detail)),
    );
  }
}
