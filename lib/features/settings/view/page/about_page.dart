import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SafeArea(
        minimum: REdgeInsets.all(Sizes.p24).copyWith(top: 0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OurStory',
                  style: context.titleLarge,
                ).tr(),
                Gap.h12,
                Image.asset(
                  AppConstant.flowerLogo,
                  height: 200.h,
                ),
                Gap.h24,
                const Text(AppConstant.story),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
