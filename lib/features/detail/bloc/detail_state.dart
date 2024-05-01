part of 'detail_bloc.dart';

class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {
  const DetailInitial();
}

class DetailLoading extends DetailState {
  const DetailLoading();
}

class DetailLoaded extends DetailState {
  const DetailLoaded({required this.movieDetail});
  final Detail movieDetail;

  @override
  List<Object?> get props => [movieDetail];
}

class DetailError extends DetailState {
  const DetailError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
