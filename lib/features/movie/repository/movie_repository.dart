import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/services/network_info.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:movie_mvvm/features/movie/models/movie.dart';

abstract class MovieRepository {
  const MovieRepository();
  ResultFuture<List<Movie>> getMoviesForDashboard(int page);
  ResultFuture<List<Movie>> searchMovies(String title, int page);
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({
    required http.Client client,
    required NetworkInfo networkInfo,
  })  : _client = client,
        _networkInfo = networkInfo;

  final http.Client _client;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<List<Movie>> getMoviesForDashboard(int page) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final apiKey = dotenv.env['APIKEY'];
      final url = '${AppConstant.baseUrl}$apiKey&s=batman&page=$page';
      final response = await _client.get(Uri.parse(url));
      final decode = jsonDecode(response.body) as ResultMap;
      if (response.statusCode != 200 || decode['Error'] != null) {
        return Left(ServerFailure(message: decode['Error'] as String));
      }

      final movieList = (decode['Search'] as List<dynamic>)
          .map((movie) => Movie.fromJson(movie as ResultMap))
          .toList();
      return Right(movieList);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<List<Movie>> searchMovies(String title, int page) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final apiKey = dotenv.env['APIKEY'];
      final url = '${AppConstant.baseUrl}$apiKey&s=$title&page=$page';
      final response = await _client.get(Uri.parse(url));
      final decode = jsonDecode(response.body) as ResultMap;
      if (response.statusCode != 200 || decode['Error'] != null) {
        return Left(ServerFailure(message: decode['Error'] as String));
      }
      final movieList = (decode['Search'] as List<dynamic>)
          .map((movie) => Movie.fromJson(movie as ResultMap))
          .toList();
      return Right(movieList);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
