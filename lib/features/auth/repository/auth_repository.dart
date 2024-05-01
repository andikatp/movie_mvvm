import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/errors/failures.dart';
import 'package:movie_mvvm/core/utils/typedef.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> login({
    required String username,
    required String password,
  });

  ResultFuture<void> saveToken({required String token});
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required SharedPreferences preference})
      : _preference = preference;
  final SharedPreferences _preference;

  @override
  ResultFuture<void> login({
    required String username,
    required String password,
  }) async {
    final usernameEnv = dotenv.env['USERNAME'];
    final passwordEnv = dotenv.env['PASSWORD'];
    if (username != usernameEnv || password != passwordEnv) {
      return const Left(
        ServerFailure(message: 'LoginErrorMessage'),
      );
    }
    return const Right(null);
  }

  @override
  ResultFuture<void> saveToken({required String token}) async {
    try {
      await _preference.setString(AppConstant.tokenKey, token);
      return const Right(null);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
