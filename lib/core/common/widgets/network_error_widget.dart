import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({required this.onRetry, super.key});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: REdgeInsets.all(Sizes.p36),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppConstant.networkErrorLottie,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            Gap.h24,
            Text(
              'NoInternetConnection',
              style: context.headlineSmall,
              textAlign: TextAlign.center,
            ).tr(),
            Gap.h24,
            ElevatedButton(
                onPressed: onRetry, child: const Text('TryAgain').tr(),),
          ],
        ),
      ),
    );
  }
}
