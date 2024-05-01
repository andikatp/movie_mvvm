import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_mvvm/core/common/widgets/network_error_widget.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/features/movie/bloc/movie_bloc.dart';
import 'package:movie_mvvm/features/movie/view/widgets/empty_animation.dart';
import 'package:movie_mvvm/features/movie/view/widgets/tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  int _currentPage = 1;
  bool _showbtn = false;

  @override
  void initState() {
    _controller = TextEditingController();
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
      .add(GetMoviesOnSearchEvent(title: 'boom', page: _currentPage));

  void _searchMovie() => context.read<MovieBloc>().add(
        GetMoviesOnSearchEvent(
          title: _controller.text.trim(),
          page: _currentPage,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showbtn ? 1.0 : 0.0,
        child: FloatingActionButton(
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
      extendBody: true,
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: REdgeInsets.symmetric(horizontal: Sizes.p16),
            suffixIcon: IconButton(
              onPressed: () => _controller.clear(),
              icon: const Icon(Icons.clear),
            ),
          ),
          onSubmitted: (_) => _searchMovie(),
        ),
      ),
      body: SafeArea(
        minimum: REdgeInsets.all(Sizes.p16).copyWith(bottom: 0),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return EmptyAnimation(
                  lottieAsset: AppConstant.searchLottie,
                  text: 'SearchMessage'.tr(),
                );
              case Status.loading:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              case Status.error:
                return state.errorMessage.contains('internet')
                    ? SingleChildScrollView(
                        child: NetworkErrorWidget(onRetry: _retry),
                      )
                    : EmptyAnimation(
                        lottieAsset: AppConstant.empty,
                        text: state.errorMessage,
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
