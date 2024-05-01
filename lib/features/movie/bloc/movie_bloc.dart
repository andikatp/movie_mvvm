import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_mvvm/features/movie/models/movie.dart';
import 'package:movie_mvvm/features/movie/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required MovieRepository repository})
      : _repository = repository,
        super(const MovieState()) {
    on<GetMoviesOnDashboardEvent>(
      getMoviesForDashboardHandler,
      transformer: droppable(),
    );
    on<GetMoviesOnSearchEvent>(
      getMoviesForSearchHandler,
      transformer: droppable(),
    );
  }

  final MovieRepository _repository;

  Future<void> getMoviesForDashboardHandler(
    GetMoviesOnDashboardEvent event,
    Emitter<MovieState> emit,
  ) async {
    if (!state.hasReachedMax) {
      emit(state.copyWith(status: Status.loading));
      final result = await _repository.getMoviesForDashboard(event.page);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              status: Status.error,
              errorMessage: failure.errorMessage,
            ),
          );
        },
        (movies) {
          final newMovies = List.of(state.movies)..addAll(movies);
          final hasReachedMax = movies.isEmpty;
          emit(
            state.copyWith(
              status: Status.success,
              movies: hasReachedMax ? state.movies : newMovies,
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      );
    }
  }

  Future<void> getMoviesForSearchHandler(
    GetMoviesOnSearchEvent event,
    Emitter<MovieState> emit,
  ) async {
    if (!state.hasReachedMax) {
      emit(state.copyWith(status: Status.loading));
      final result = await _repository.searchMovies(event.title, event.page);
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              status: Status.error,
              errorMessage: failure.errorMessage,
            ),
          );
        },
        (movies) {
          final newMovies = List.of(state.movies)..addAll(movies);
          final hasReachedMax = movies.isEmpty;
          emit(
            state.copyWith(
              status: Status.success,
              movies: hasReachedMax ? state.movies : newMovies,
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      );
    }
  }
}
