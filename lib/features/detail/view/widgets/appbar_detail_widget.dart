import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';
import 'package:movie_mvvm/core/res/colours.dart';
import 'package:movie_mvvm/features/detail/models/detail.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';
import 'package:movie_mvvm/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({
    required this.movie,
    super.key,
  });

  final Detail movie;

  @override
  Widget build(BuildContext context) {
    
    void toggleFavorites(MovieFavorite movie) =>
        context.read<FavoriteViewModel>().toggleFavorite(movie);

    return SliverAppBar.large(
      title: Text(
        movie.Title,
        style: context.titleMedium,
      ),
      expandedHeight: 0.6.sh,
      actions: [
        Consumer<FavoriteViewModel>(
          builder: (_, provider, __) {
            final movieFavorite = MovieFavorite(
              Title: movie.Title,
              Year: movie.Year,
              Type: movie.Type,
              imdbID: movie.imdbID,
              Poster: movie.Poster,
            );
            return LikeButton(
              onTap: (isLiked) async {
                toggleFavorites(movieFavorite);
                return !isLiked;
              },
              isLiked: provider.isFavorite(movieFavorite),
            );
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: movie.Poster,
                fit: BoxFit.cover,
                placeholder: (_, __) => const Center(
                  child: CupertinoActivityIndicator(
                    color: Colours.primaryColor,
                  ),
                ),
                errorWidget: (_, __, error) => const Icon(Icons.error),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colours.backgroundColor,
                    ],
                    stops: [0, 0.97],
                  ),
                ),
              ),
            ),
            Positioned(
              child: CachedNetworkImage(
                imageUrl: movie.Poster,
                height: 0.5.sh,
                fit: BoxFit.cover,
                placeholder: (_, __) => const Center(
                  child: CupertinoActivityIndicator(
                    color: Colours.primaryColor,
                  ),
                ),
                errorWidget: (_, __, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: Sizes.p48,
              right: Sizes.p20,
              child: Wrap(
                spacing: Sizes.p8,
                children: [
                  Icon(
                    Icons.star,
                    color: Colours.primaryColor,
                    size: Sizes.p24.sp,
                  ),
                  Text(movie.imdbRating),
                ],
              ),
            ),
            Positioned(
              bottom: Sizes.p40,
              left: Sizes.p16,
              child: Chip(
                label: Text(
                  movie.Rated,
                  style: context.bodySmall.copyWith(
                    fontSize: Sizes.p12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
