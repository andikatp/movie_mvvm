part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends DetailEvent {
  const GetMovieDetailEvent({
    required this.imdbID,
  });

  final String imdbID;

  @override
  List<Object> get props => [imdbID];
}
