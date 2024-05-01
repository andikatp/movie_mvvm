import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/common/widgets/network_error_widget.dart';
import 'package:movie_mvvm/features/detail/bloc/detail_bloc.dart';
import 'package:movie_mvvm/features/detail/view/widgets/appbar_detail_widget.dart';
import 'package:movie_mvvm/features/detail/view/widgets/detail_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imdbID = GoRouterState.of(context).extra! as String;

    void retry() =>
        context.read<DetailBloc>().add(GetMovieDetailEvent(imdbID: imdbID));

    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is DetailLoaded) {
            final movie = state.movieDetail;
            return CustomScrollView(
              slivers: [
                AppBarDetail(movie: movie),
                DetailWidget(movie: movie),
              ],
            );
          }
          if (state is DetailError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            });
          }
          return NetworkErrorWidget(onRetry: retry);
        },
      ),
    );
  }
}
