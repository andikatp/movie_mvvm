part of 'router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routerNeglect: true,
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash.name,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: '/auth',
      name: Routes.auth.name,
      builder: (_, __) =>
          BlocProvider(create: (_) => sl<AuthBloc>(), child: const LoginPage()),
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => HomePage(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              name: Routes.dashboard.name,
              builder: (_, __) => BlocProvider(
                create: (_) => sl<MovieBloc>()
                  ..add(const GetMoviesOnDashboardEvent(page: 1)),
                child: const DashboardPage(),
              ),
              routes: [
                GoRoute(
                  path: 'search',
                  name: Routes.search.name,
                  builder: (_, __) => BlocProvider(
                    create: (_) => sl<MovieBloc>(),
                    child: const SearchPage(),
                  ),
                ),
                GoRoute(
                  path: 'detail',
                  name: Routes.detail.name,
                  builder: (_, state) => BlocProvider(
                    create: (_) {
                      final imdbID = state.extra! as String;
                      return sl<DetailBloc>()
                        ..add(GetMovieDetailEvent(imdbID: imdbID));
                    },
                    child: const DetailPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorite',
              name: Routes.favorite.name,
              builder: (_, __) => const FavoritePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: Routes.settings.name,
              builder: (_, __) => BlocProvider(
                create: (_) => sl<SettingsBloc>(),
                child: const SettingPage(),
              ),
              routes: [
                GoRoute(
                  path: 'about-us',
                  name: Routes.about.name,
                  builder: (_, __) => const AboutPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
