import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing/routing.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/cubit/login_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/cubit/login_state.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/widgerts/email_and_password.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/already_have_account.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/widgerts/login_dialogs.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/widgerts/login_logo.dart';
import '../../../../core/general_widgets/app_text_buttom.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showSuccessLoginDialog(context);
          } else if (state is LoginError) {
            setupErrorLoginState(context, state.message);
          }
        },
        builder: (context, state) {
          return Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFb7e67e),
                  Color(0xFF58cc02),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(  top: screenHeight * 0.17, left: 20.w, right: 20.w),
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .5),
                      borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(16.0.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.05),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 48.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF58CC02),
                              ),
                            ),
                             SizedBox(height: 16.h),
                            const EmailAndPassword(),
                             SizedBox(height: 16.h),
                            if (state is LoginLoading)
                              const CircularProgressIndicator()
                            else
                              FractionallySizedBox(
                                widthFactor: 0.99,
                                child: CustomButton(
                                  label: "Login",
                                  variant: ButtonVariant.secondary,
                                  size: ButtonSize.default_,
                                  onPressed: () {
                                    context.read<LoginCubit>().login(context);},
                                ),
                              ),
                            const SizedBox(height: 16),
                             AlreadyHaveAccountText(text: 'Register',account: "don't have an account",onActionPressed:(){GoRouter.of(context).push(Routes.kRegisterView);}  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const LoginLogo(),
              ],
            ),
          );
        },
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Login successful!'),
        actions: [
          TextButton(
            onPressed: () {
              context.go(Routes.kTopicsView);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // void setupErrorState(BuildContext context, String error) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(error),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }
}
