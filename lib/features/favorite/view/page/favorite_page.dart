import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/features/favorite/view/widgets/tile_favorite.dart';
import 'package:movie_mvvm/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:movie_mvvm/features/movie/view/widgets/empty_animation.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: REdgeInsets.symmetric(horizontal: Sizes.p12),
        child: Consumer<FavoriteViewModel>(
          builder: (context, provider, _) {
            if (provider.movies.isEmpty) {
              return EmptyAnimation(
                lottieAsset: AppConstant.emptySavedLottie,
                text: 'InitialSaved'.tr(),
              );
            }
            if (provider.messageOfError.isNotEmpty) {
              return Center(
                child: Text(
                  provider.messageOfError,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return MasonryGridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: provider.movies.length,
              itemBuilder: (context, index) => FadeIn(
                child: TileFavorite(
                  extent: (index % 5 + 1) * 100,
                  movie: provider.movies[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
