import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';
import 'package:movie_mvvm/core/res/colours.dart';
import 'package:movie_mvvm/core/services/router.dart';
import 'package:movie_mvvm/features/favorite/models/movie_favorite.dart';
import 'package:movie_mvvm/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

class TileFavorite extends StatelessWidget {
  const TileFavorite({required this.movie, required this.extent, super.key});

  final int extent;
  final MovieFavorite movie;

  @override
  Widget build(BuildContext context) {
    void toggleFavorites(MovieFavorite movie) =>
        context.read<FavoriteViewModel>().toggleFavorite(movie);
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.detail.name, extra: movie.imdbID),
      child: Stack(
        children: [
          Card(
            color: Colours.backgroundColor,
            surfaceTintColor: Colours.backgroundColor,
            shadowColor: Colours.primaryColor,
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16).r,
                  child: CachedNetworkImage(
                    key: key,
                    width: double.infinity,
                    imageUrl: movie.Poster,
                    height: extent.h,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    cacheManager: CacheManager(
                      Config(
                        'movie',
                        stalePeriod: const Duration(minutes: 5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.Title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: context.bodySmall.copyWith(fontSize: 14),
                      ),
                      Wrap(
                        spacing: Sizes.p12.w,
                        children: [
                          Chip(
                            label: Text(
                              movie.Type.capitalize(),
                              style: context.bodySmall.copyWith(
                                fontSize: 12,
                                color: movie.Type.getColorForType(),
                              ),
                            ),
                            color: MaterialStateProperty.all(Colors.black12),
                            padding: REdgeInsets.all(2),
                          ),
                          Chip(
                            label: Text(
                              movie.Year,
                              style: context.bodySmall
                                  .copyWith(fontSize: 12, color: Colors.white),
                            ),
                            color: MaterialStateProperty.all(Colors.black12),
                            padding: REdgeInsets.all(2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Consumer<FavoriteViewModel>(
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
          ),
        ],
      ),
    );
  }
}
