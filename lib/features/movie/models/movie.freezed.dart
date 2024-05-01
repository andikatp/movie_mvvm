// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  String get Title => throw _privateConstructorUsedError;
  String get Year => throw _privateConstructorUsedError;
  String get imdbID => throw _privateConstructorUsedError;
  String get Type => throw _privateConstructorUsedError;
  String get Poster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {String Title, String Year, String imdbID, String Type, String Poster});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Title = null,
    Object? Year = null,
    Object? imdbID = null,
    Object? Type = null,
    Object? Poster = null,
  }) {
    return _then(_value.copyWith(
      Title: null == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Year: null == Year
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      imdbID: null == imdbID
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String,
      Type: null == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: null == Poster
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Title, String Year, String imdbID, String Type, String Poster});
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Title = null,
    Object? Year = null,
    Object? imdbID = null,
    Object? Type = null,
    Object? Poster = null,
  }) {
    return _then(_$MovieImpl(
      Title: null == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      Year: null == Year
          ? _value.Year
          : Year // ignore: cast_nullable_to_non_nullable
              as String,
      imdbID: null == imdbID
          ? _value.imdbID
          : imdbID // ignore: cast_nullable_to_non_nullable
              as String,
      Type: null == Type
          ? _value.Type
          : Type // ignore: cast_nullable_to_non_nullable
              as String,
      Poster: null == Poster
          ? _value.Poster
          : Poster // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl with DiagnosticableTreeMixin implements _Movie {
  const _$MovieImpl(
      {required this.Title,
      required this.Year,
      required this.imdbID,
      required this.Type,
      required this.Poster});

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final String Title;
  @override
  final String Year;
  @override
  final String imdbID;
  @override
  final String Type;
  @override
  final String Poster;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Movie(Title: $Title, Year: $Year, imdbID: $imdbID, Type: $Type, Poster: $Poster)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Movie'))
      ..add(DiagnosticsProperty('Title', Title))
      ..add(DiagnosticsProperty('Year', Year))
      ..add(DiagnosticsProperty('imdbID', imdbID))
      ..add(DiagnosticsProperty('Type', Type))
      ..add(DiagnosticsProperty('Poster', Poster));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.Title, Title) || other.Title == Title) &&
            (identical(other.Year, Year) || other.Year == Year) &&
            (identical(other.imdbID, imdbID) || other.imdbID == imdbID) &&
            (identical(other.Type, Type) || other.Type == Type) &&
            (identical(other.Poster, Poster) || other.Poster == Poster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, Title, Year, imdbID, Type, Poster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final String Title,
      required final String Year,
      required final String imdbID,
      required final String Type,
      required final String Poster}) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  String get Title;
  @override
  String get Year;
  @override
  String get imdbID;
  @override
  String get Type;
  @override
  String get Poster;
  @override
  @JsonKey(ignore: true)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
