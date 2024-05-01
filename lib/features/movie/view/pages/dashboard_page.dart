import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/common/widgets/network_error_widget.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/services/router.dart';
import 'package:movie_mvvm/features/movie/bloc/movie_bloc.dart';
import 'package:movie_mvvm/features/movie/view/widgets/tile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ScrollController _scrollController;
  int _currentPage = 1;
  bool _showbtn = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(_loadMore)
      ..addListener(_getBackToTheTop);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_loadMore)
      ..dispose();
    super.dispose();
  }

  void _loadMore() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll) {
      setState(() => _currentPage++);
      context
          .read<MovieBloc>()
          .add(GetMoviesOnDashboardEvent(page: _currentPage));
    }
  }

  void _getBackToTheTop() {
    const showoffset = 10;
    _scrollController.offset > showoffset
        ? setState(() => _showbtn = true)
        : setState(() => _showbtn = false);
  }

  void _retry() => context
      .read<MovieBloc>()
      .add(GetMoviesOnDashboardEvent(page: _currentPage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap(
        spacing: Sizes.p12,
        direction: Axis.vertical,
        alignment: WrapAlignment.end,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showbtn ? 1.0 : 0.0,
            child: FloatingActionButton(
              heroTag: 'backToTop',
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              child: const Icon(Icons.arrow_upward),
            ),
          ),
          FloatingActionButton(
            heroTag: 'search',
            onPressed: () => context.pushNamed(Routes.search.name),
            child: const Icon(Icons.search),
          ),
        ],
      ),
      extendBody: true,
      body: SafeArea(
        minimum: REdgeInsets.symmetric(horizontal: Sizes.p12),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const SizedBox();
              case Status.loading:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              case Status.error:
                return state.errorMessage
                        .contains('internet')
                    ? NetworkErrorWidget(onRetry: _retry)
                    : Center(
                        child: Text(state.errorMessage),
                      );
              case Status.success:
                final movies = state.movies;
                return MasonryGridView.count(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) => FadeIn(
                    child: Tile(
                      extent: (index % 5 + 1) * 100,
                      movie: movies[index],
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
