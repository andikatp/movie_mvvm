import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/navigations/bottom_navigation.dart';
import 'package:movie_mvvm/core/services/dependency_container.dart';
import 'package:movie_mvvm/features/auth/bloc/auth_bloc.dart';
import 'package:movie_mvvm/features/auth/view/pages/login_page.dart';
import 'package:movie_mvvm/features/detail/bloc/detail_bloc.dart';
import 'package:movie_mvvm/features/detail/view/pages/detail_page.dart';
import 'package:movie_mvvm/features/favorite/view/page/favorite_page.dart';
import 'package:movie_mvvm/features/movie/bloc/movie_bloc.dart';
import 'package:movie_mvvm/features/movie/view/pages/dashboard_page.dart';
import 'package:movie_mvvm/features/movie/view/pages/search_page.dart';
import 'package:movie_mvvm/features/settings/bloc/settings_bloc.dart';
import 'package:movie_mvvm/features/settings/view/page/about_page.dart';
import 'package:movie_mvvm/features/settings/view/page/setting_page.dart';
import 'package:movie_mvvm/features/splash/view/pages/splash_page.dart';

part 'router.main.dart';

enum Routes {
  splash,
  auth,
  home,
  dashboard,
  detail,
  search,
  favorite,
  settings,
  about,
}
