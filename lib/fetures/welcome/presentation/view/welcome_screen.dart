import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/fetures/welcome/presentation/view/widgets/image_logo.dart';
import 'package:intelligent_tutoring_system/fetures/welcome/presentation/view/widgets/tittle.dart';
import '../../../../core/general_widgets/app_text_buttom.dart';
import '../../../../core/routing/routing.dart';
import '../../../../core/general_widgets/already_have_account.dart';
import 'widgets/welcome_illustration.dart';
import 'widgets/welcome_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.h),
                const AppTitle(),
                const LogoImage(),
                const WelcomeIllustration(),
                SizedBox(height: 24.h),
                const WelcomeText(),
                SizedBox(height: 20.h),
                FractionallySizedBox(
                  widthFactor: 0.99,
                  child: CustomButton(
                    label: "GET STARTED",
                    variant: ButtonVariant.secondary,
                    size: ButtonSize.lg,
                    onPressed: () {
                      GoRouter.of(context).push(Routes.kLoginView);
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                AlreadyHaveAccountText(
                  text: 'Sign up',
                  onActionPressed: () =>
                      GoRouter.of(context).push(Routes.kRegisterView),
                  account: "don't have an account?",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
