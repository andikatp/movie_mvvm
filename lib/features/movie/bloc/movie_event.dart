part of 'movie_bloc.dart';

class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class GetMoviesOnDashboardEvent extends MovieEvent {
  const GetMoviesOnDashboardEvent({required this.page});
  final int page;

  @override
  List<int> get props => [page];
}

class GetMoviesOnSearchEvent extends MovieEvent {
  const GetMoviesOnSearchEvent({required this.title, required this.page});

  final String title;
  final int page;

  @override
  List<int> get props => [page];
}
