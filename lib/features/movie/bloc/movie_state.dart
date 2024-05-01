part of 'movie_bloc.dart';

enum Status { initial, loading, success, error }

class MovieState extends Equatable {
  const MovieState({
    this.status = Status.initial,
    this.hasReachedMax = false,
    this.movies = const [],
    this.errorMessage = '',
  });

  final Status status;
  final List<Movie> movies;
  final bool hasReachedMax;
  final String errorMessage;

  MovieState copyWith({
    Status? status,
    List<Movie>? movies,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax, errorMessage];
}
