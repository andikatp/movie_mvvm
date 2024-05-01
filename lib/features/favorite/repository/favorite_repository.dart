import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';
import 'package:movie_mvvm/features/favorite/services/app_database.dart';

abstract class FavoriteRepository {
  const FavoriteRepository();

  ResultFuture<List<MovieFavorite>> getSavedMovies();
  ResultFuture<void> deleteSavedMovie(MovieFavorite movie);
  ResultFuture<void> saveMovie(MovieFavorite movie);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required AppDatabase database})
      : _database = database;
  final AppDatabase _database;

  @override
  ResultFuture<List<MovieFavorite>> getSavedMovies() async {
    try {
      final result = await _database.movieDao.getMovies();
      return Right(result);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> deleteSavedMovie(MovieFavorite movie) async {
    try {
      final result = await _database.movieDao.deleteSavedMovie(movie);
      return Right(result);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<void> saveMovie(MovieFavorite movie) async {
    try {
      final result = await _database.movieDao.saveMovie(movie);
      return Right(result);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
