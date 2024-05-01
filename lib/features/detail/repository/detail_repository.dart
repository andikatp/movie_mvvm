import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/services/network_info.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:movie_mvvm/features/detail/models/detail.dart';

abstract class DetailRepository {
  const DetailRepository();

  ResultFuture<Detail> getMovieDetail(String imdbID);
}

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl({
    required NetworkInfo networkInfo,
    required http.Client client,
  })  : _networkInfo = networkInfo,
        _client = client;

  final NetworkInfo _networkInfo;
  final http.Client _client;

  @override
  ResultFuture<Detail> getMovieDetail(String imdbID) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final apiKey = dotenv.env['APIKEY'];
      final url = '${AppConstant.baseUrl}$apiKey&i=$imdbID';
      final response = await _client.get(Uri.parse(url));
      final decode = jsonDecode(response.body) as ResultMap;
      if (response.statusCode != 200) {
        return Left(ServerFailure(message: decode['Error'] as String));
      }
      final movieDetail = Detail.fromJson(decode);
      return Right(movieDetail);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
