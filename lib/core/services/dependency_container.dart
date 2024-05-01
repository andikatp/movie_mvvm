import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie_mvvm/core/services/network_info.dart';
import 'package:movie_mvvm/features/auth/bloc/auth_bloc.dart';
import 'package:movie_mvvm/features/auth/repository/auth_repository.dart';
import 'package:movie_mvvm/features/detail/bloc/detail_bloc.dart';
import 'package:movie_mvvm/features/detail/repository/detail_repository.dart';
import 'package:movie_mvvm/features/favorite/repository/favorite_repository.dart';
import 'package:movie_mvvm/features/favorite/services/app_database.dart';
import 'package:movie_mvvm/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:movie_mvvm/features/movie/bloc/movie_bloc.dart';
import 'package:movie_mvvm/features/movie/repository/movie_repository.dart';
import 'package:movie_mvvm/features/settings/bloc/settings_bloc.dart';
import 'package:movie_mvvm/features/settings/repository/settings_repository.dart';
import 'package:movie_mvvm/features/splash/cubit/splash_cubit.dart';
import 'package:movie_mvvm/features/splash/repository/splash_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dependency_container.main.dart';