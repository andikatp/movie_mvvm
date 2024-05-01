import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_mvvm/core/common/widgets/dropdown_flag.dart';
import 'package:movie_mvvm/core/constants/app_constant.dart';
import 'package:movie_mvvm/core/constants/app_sizes.dart';
import 'package:movie_mvvm/core/extensions/extension.dart';
import 'package:movie_mvvm/core/res/colours.dart';
import 'package:movie_mvvm/core/services/router.dart';
import 'package:movie_mvvm/features/auth/bloc/auth_bloc.dart';
import 'package:movie_mvvm/features/auth/view/widgets/input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    String? usernameValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'UsernameValidatorNull'.tr();
      }
      return null;
    }

    void loginHandler() {
      FocusManager.instance.primaryFocus?.unfocus();
      if (formKey.currentState!.validate()) {
        final username = usernameController.text.trim();
        final password = passwordController.text.trim();
        context
            .read<AuthBloc>()
            .add(LoginEvent(username: username, password: password));
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: REdgeInsets.only(right: 20),
            child: const DropdownFlag(),
          ),
        ],
      ),
      body: SafeArea(
        minimum: REdgeInsets.symmetric(horizontal: Sizes.p36),
        child: Form(
          key: formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoggedIn) {
                context
                    .read<AuthBloc>()
                    .add(const SaveTokenEvent(token: 'laterImplemented'));
                context.goNamed(Routes.dashboard.name);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    KeyboardVisibilityBuilder(
                      builder: (_, isKeyboardVisible) => !isKeyboardVisible
                          ? Image.asset(
                              AppConstant.logo,
                              width: 0.5.sw,
                            )
                          : const SizedBox(),
                    ),
                    Gap.h20,
                    GeneralInputField(
                      type: TextInputType.name,
                      controller: usernameController,
                      label: 'Username',
                      icon: Icons.person,
                      validator: usernameValidator,
                    ),
                    Gap.h20,
                    PasswordInputField(controller: passwordController),
                    Gap.h28,
                    if (state is AuthError)
                      Text(
                        state.message.tr(),
                        style: context.bodySmall
                            .copyWith(fontSize: 14.sp, color: Colors.red),
                      ),
                    Gap.h20,
                    ElevatedButton(
                      onPressed: state is AuthLoading ? null : loginHandler,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colours.primaryColor,
                        foregroundColor: Colours.backgroundColor,
                        minimumSize: const Size.fromHeight(Sizes.p72),
                        shadowColor: Colors.black12,
                        elevation: 0,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16).r,
                        ),
                      ),
                      child: state is AuthLoading
                          ? const CupertinoActivityIndicator()
                          : const Text('Login').tr(context: context),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
