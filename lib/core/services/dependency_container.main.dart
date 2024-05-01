part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initSplash();
  await _initAuth();
  await _initMovie();
  await _initDetail();
  await _initSettings();
  await _initFavorite();
}

Future<void> _initSplash() async {
  //feature --> Splash
  //Business Logic
  sl
    ..registerFactory(() => SplashCubit(repository: sl()))
    // repositories
    ..registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(preference: sl()),
    )
    // datasources
    ..registerLazySingletonAsync(SharedPreferences.getInstance);
  // other
  await GetIt.instance.isReady<SharedPreferences>();
}

Future<void> _initAuth() async {
  //feature --> Auth
  //Business Logic
  sl
    ..registerFactory(() => AuthBloc(repository: sl()))
    // repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(preference: sl()),
    );
}

Future<void> _initMovie() async {
  //feature --> Movie
  //Business Logic
  sl
    ..registerFactory(() => MovieBloc(repository: sl()))
    // repositories
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(client: sl(), networkInfo: sl()),
    )
    // others
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(networkInfo: sl()),
    )
    ..registerLazySingleton(InternetConnection.new)
    ..registerLazySingleton(http.Client.new);
}

Future<void> _initDetail() async {
  //feature --> Detail
  //Business Logic
  sl
    ..registerFactory(() => DetailBloc(repository: sl()))
    // repositories
    ..registerLazySingleton<DetailRepository>(
      () => DetailRepositoryImpl(client: sl(), networkInfo: sl()),
    );
}

Future<void> _initSettings() async {
  //feature --> Settings
  //Business Logic
  sl
    ..registerFactory(() => SettingsBloc(repository: sl()))
    // repositories
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(preferences: sl()),
    );
}

Future<void> _initFavorite() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //feature --> Favorite
  //Business Logic
  sl
    ..registerFactory(() => FavoriteViewModel(repository: sl()))
    // repositories
    ..registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(database: sl()),
    )
    // others
    ..registerSingleton<AppDatabase>(database);
}
