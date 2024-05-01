import 'dart:async';
import 'package:floor/floor.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';
import 'package:movie_mvvm/features/favorite/services/DAO/movie_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart';

@Database(version: 1, entities: [MovieFavorite])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
