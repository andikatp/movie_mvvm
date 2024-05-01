// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      Title: json['Title'] as String,
      Year: json['Year'] as String,
      imdbID: json['imdbID'] as String,
      Type: json['Type'] as String,
      Poster: json['Poster'] as String,
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'imdbID': instance.imdbID,
      'Type': instance.Type,
      'Poster': instance.Poster,
    };
