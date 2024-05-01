import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsRepository {
  const SettingsRepository();

  ResultFuture<void> logout();
}

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required SharedPreferences preferences})
      : _preferences = preferences;

  final SharedPreferences _preferences;

  @override
  ResultFuture<void> logout() async {
    try {
      await _preferences.remove(AppConstant.tokenKey);
      return const Right(null);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
