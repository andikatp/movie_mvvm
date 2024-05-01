import 'package:flutter/material.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';
import 'package:movie_mvvm/features/favorite/repository/favorite_repository.dart';

class FavoriteViewModel with ChangeNotifier {
  FavoriteViewModel({required FavoriteRepository repository})
      : _repository = repository;

  final FavoriteRepository _repository;

  List<MovieFavorite> _movies = [];
  String _errorMessage = '';

  List<MovieFavorite> get movies => _movies;
  String get messageOfError => _errorMessage;

  bool isFavorite(MovieFavorite movieArgs) {
    getSavedMovies();
    return _movies.any((movie) => movie.imdbID == movieArgs.imdbID);
  }

  void toggleFavorite(MovieFavorite movieArgs) {
    _movies.any((movie) => movie.imdbID == movieArgs.imdbID)
        ? deleteSavedMovie(movieArgs)
        : saveMovie(movieArgs);
    notifyListeners();
  }

  Future<void> getSavedMovies() async {
    final result = await _repository.getSavedMovies();
    result.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (movies) => _movies = movies,
    );
  }

  Future<void> saveMovie(MovieFavorite movie) async {
    final result = await _repository.saveMovie(movie);
    result.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (_) => _movies.add(movie),
    );
    notifyListeners();
  }

  Future<void> deleteSavedMovie(MovieFavorite movie) async {
    final result = await _repository.deleteSavedMovie(movie);
    result.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (_) => _movies.remove(movie),
    );
    notifyListeners();
  }
}
