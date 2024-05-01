import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/common/widgets/dropdown_flag.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/services/router.dart';
import 'package:movie_mvvm/features/settings/bloc/settings_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void goToAboutUs() => context.pushNamed(Routes.about.name);
    void logout() => context.read<SettingsBloc>().add(const LogoutEvent());

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: Sizes.p20),
            child: DropdownFlag(),
          ),
        ],
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (_, state) {
          if (state is LoggedOut) {
            context.goNamed(Routes.auth.name);
          }
        },
        child: SafeArea(
          minimum: REdgeInsets.symmetric(horizontal: Sizes.p32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(AppConstant.profile),
                  ),
                ),
                Gap.h20,
                Text(dotenv.env['USERNAME']!),
                Gap.h20,
                ListTile(
                  leading: const Icon(Icons.question_mark),
                  onTap: goToAboutUs,
                  title: const Text('About').tr(context: context),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: logout,
                  title: const Text('Logout').tr(context: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
