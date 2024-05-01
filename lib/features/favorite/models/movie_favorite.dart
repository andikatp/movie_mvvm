// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'movies', primaryKeys: ['imdbID'])
class MovieFavorite extends Equatable {
  const MovieFavorite(
      {required this.Title,
      required this.Year,
      required this.Type,
      required this.imdbID,
      required this.Poster,});

  final String Title;
  final String Year;
  final String Type;
  final String imdbID;
  final String Poster;
  
  @override
  List<String> get props => [imdbID];
}
