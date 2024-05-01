import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';

class EmptyAnimation extends StatelessWidget {
  const EmptyAnimation({
    required this.lottieAsset,
    required this.text,
    super.key,
  });
  final String lottieAsset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          lottieAsset,
          height: 200.h,
          fit: BoxFit.cover,
        ),
        Gap.h12,
        Center(
          child: Text(
            text,
            style: context.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Gap.h20,
      ],
    );
  }
}
