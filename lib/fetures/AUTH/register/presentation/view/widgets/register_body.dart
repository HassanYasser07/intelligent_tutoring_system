// file: widgets/register_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';

import '../../../../../../core/general_widgets/already_have_account.dart';
import '../../../../../../core/general_widgets/app_text_buttom.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_state.dart';
import 'form_header.dart';
import 'sign_up_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  final ScrollController scrollController;
  final double opacity;
  final RegisterState state;

  const RegisterBody({
    super.key,
    required this.scrollController,
    required this.opacity,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFb7e67e), Color(0xFF58cc02)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Form Section
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        const FormHeader(),
                        SizedBox(height: 16.h),
                        const SignupForm(),
                        SizedBox(height: 16.h),
                        if (state is RegisterLoading)
                          const CircularProgressIndicator()
                        else
                          FractionallySizedBox(
                            widthFactor: 0.99,
                            child: CustomButton(
                              label: "Signup",
                              variant: ButtonVariant.secondary,
                              size: ButtonSize.default_,
                              onPressed: () {
                                context.read<RegisterCubit>().register();
                              },
                            ),
                          ),
                        const SizedBox(height: 16),
                        AlreadyHaveAccountText(
                          account: 'Already have an account?',
                          text: 'Login',
                          onActionPressed: () {
                            GoRouter.of(context).push(Routes.kLoginView);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Header Image
          Positioned(
            top: 40.h,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: opacity,
              child: Column(
                children: [
                  SizedBox(
                    width: 170.w,
                    height: 170.h,
                    child: Image.asset('assets/6.png', fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
