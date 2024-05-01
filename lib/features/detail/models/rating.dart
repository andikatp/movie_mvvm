// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class Rating with _$Rating {
  const factory Rating({
    required String Source,
    required String Value,
  }) = _Rating;

  factory Rating.fromJson(ResultMap json) => _$RatingFromJson(json);
}
