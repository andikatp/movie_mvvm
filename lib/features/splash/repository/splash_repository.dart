import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashRepository {
  const SplashRepository();

  ResultFuture<bool> checkUserLoggedIn();
}

class SplashRepositoryImpl implements SplashRepository {
  SplashRepositoryImpl({required SharedPreferences preference})
      : _preference = preference;
  final SharedPreferences _preference;

  @override
  ResultFuture<bool> checkUserLoggedIn() async {
    try {
      final result = _preference.getString(AppConstant.tokenKey);
      if (result == null) {
        return const Right(false);
      }
      return const Right(true);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
