// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:movie_mvvm/features/detail/models/rating.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  const factory Detail({
    required String Title,
    required String Year,
    required String Rated,
    required String Released,
    required String Runtime,
    required String Genre,
    required String Director,
    required String Writer,
    required String Actors,
    required String Plot,
    required String Language,
    required String Country,
    required String Awards,
    required String Poster,
    required List<Rating> Ratings,
    required String Metascore,
    required String imdbRating,
    required String imdbVotes,
    required String imdbID,
    required String Type,
    String? Website,
    String? Production,
  }) = _Detail;

  factory Detail.fromJson(ResultMap json) => _$DetailFromJson(json);
}
