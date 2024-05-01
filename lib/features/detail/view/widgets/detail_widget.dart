import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';
import 'package:movie_mvvm/core/res/colours.dart';
import 'package:movie_mvvm/features/detail/models/detail.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    required this.movie,
    super.key,
  });

  final Detail movie;

  @override
  Widget build(BuildContext context) {
    final actors = movie.Actors.split(', ');
    final genre = movie.Genre.split(', ');
    return SliverPadding(
      padding: REdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p8),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${movie.Title} ',
                    style: context.titleLarge,
                  ),
                  TextSpan(
                    text: '(${movie.Year})',
                    style: context.bodySmall.copyWith(fontSize: Sizes.p12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizes.p48.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.p16),
                  ),
                  padding: EdgeInsets.zero,
                  label: Text(
                    genre[index],
                    style: context.bodySmall.copyWith(fontSize: 10.sp),
                  ),
                ),
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemCount: genre.length,
              ),
            ),
            Gap.h20,
            Text(movie.Plot, style: context.bodySmall),
            Gap.h16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Director',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  movie.Director,
                  style: context.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Gap.h16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Writers',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  movie.Writer,
                  style: context.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Gap.h16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Awards',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  movie.Awards,
                  style: context.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Gap.h16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Runtime',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  movie.Runtime,
                  style: context.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Gap.h16,
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Text(
                  movie.Type,
                  style: context.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Gap.h16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Actors',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: Sizes.p48.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Chip(
                      label: Text(
                        actors[index],
                        style:
                            context.bodySmall.copyWith(fontSize: Sizes.p12.sp),
                      ),
                      color: MaterialStatePropertyAll(
                        Colours.primaryColor.withOpacity(0.95),
                      ),
                    ),
                    separatorBuilder: (_, __) => SizedBox(width: 10.w),
                    itemCount: actors.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
