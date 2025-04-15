import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/already_have_account.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/dialogs.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/sign_up_form.dart';
import '../../../../../core/general_widgets/app_text_buttom.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollPosition = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    setState(() {
      // Calculate opacity based on scroll position relative to max scroll
      _opacity = 1.0 - (scrollPosition / maxScroll);
      // Ensure opacity stays between 0 and 1
      _opacity = _opacity.clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Handle successful registration
            print('Token: ${state.token}');
GoRouter.of(context).push(Routes.kCourseView);            // Navigate to next screen
            print('Signup success');
          } else if (state is RegisterError) {
            setupErrorState(context, state.message);
          }
        },
        builder: (context, state) {
          return Container(
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
                Positioned(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      height: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                Text(
                                  'Signup',
                                  style: TextStyle(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFF58CC02),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const SignupForm(),
                                const SizedBox(height: 16),
                                if (state is RegisterLoading)
                                  const CircularProgressIndicator()
                                else
                                  // AppTextButtonn(
                                  //   buttonText: 'Signup',
                                  //   onPressed: () {
                                  //     context.read<RegisterCubit>().register();
                                  //   },
                                  // ),
                                  FractionallySizedBox(
                                    widthFactor: 0.99, // 80% من عرض الشاشة
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
                                      GoRouter.of(context)
                                          .push(Routes.kLoginView);
                                    }),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 430,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: _opacity,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 210,
                          height: 210,
                          child: Image.asset('assets/6.png', fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
