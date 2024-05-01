import 'package:floor/floor.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';

@dao
abstract class MovieDao {
  @insert
  Future<void> saveMovie(MovieFavorite movie);

  @delete
  Future<void> deleteSavedMovie(MovieFavorite movie);

  @Query('SELECT * FROM movies')
  Future<List<MovieFavorite>> getMovies();
}
