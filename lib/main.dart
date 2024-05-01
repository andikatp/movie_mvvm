import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mvvm/core/res/theme.dart';
import 'package:movie_mvvm/core/services/dependency_container.dart';
import 'package:movie_mvvm/core/services/router.dart';
import 'package:movie_mvvm/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:movie_mvvm/features/splash/cubit/splash_cubit.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await EasyLocalization.ensureInitialized();
  await init();
  await dotenv.load();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<FavoriteViewModel>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
          designSize: const Size(412, 732),
          minTextAdapt: true,
          builder: (_, __) => BlocProvider(
            create: (context) => sl<SplashCubit>(),
            child: MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: router,
              theme: AppTheme.currentTheme,
              themeMode: ThemeMode.light,
              highContrastDarkTheme: AppTheme.currentTheme,
              highContrastTheme: AppTheme.currentTheme,
              darkTheme: AppTheme.currentTheme,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      ),
    );
  }
}
