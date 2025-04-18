import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/cubit/login_cubit.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/cubit/login_state.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/presentation/widgerts/email_and_password.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/already_have_account.dart';
import '../../../../core/general_widgets/app_text_buttom.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showSuccessDialog(context);
          } else if (state is LoginError) {
            setupErrorState(context, state.message);
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
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 48.sp,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF58CC02),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const EmailAndPassword(),
                            const SizedBox(height: 16),
                            if (state is LoginLoading)
                              const CircularProgressIndicator()
                            else
                              // AppTextButtonn(
                              //   buttonText: 'Login',
                              //   onPressed: () {
                              //     context.read<LoginCubit>().login(context);
                              //   },
                              // ),
                              FractionallySizedBox(
                                widthFactor: 0.99, // 80% من عرض الشاشة
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
                Positioned(
                  bottom: 430,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 210,
                        height: 210,
                        child: Image.asset('assets/duo.png', fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
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
              context.go(Routes.kCourseView);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
      ),
    );
  }
}
