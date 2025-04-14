import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/already_have_account.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/dialogs.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/sign_up_form.dart';
import '../../../../../core/general_widgets/app_text_buttom.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Handle successful registration
            print('Token: ${state.token}');
            showSuccessDialog(context);
            // Navigate to next screen
            print('Signup success');
          } else if (state is RegisterError) {
            setupErrorState(context, state.message);
          }
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/tt.gif',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 16),
                    const SignupForm(),
                    const SizedBox(height: 16),
                    if (state is RegisterLoading)
                      const CircularProgressIndicator()
                    else
                      AppTextButtonn(
                        buttonText: 'Signup',
                        onPressed: () {
                          context.read<RegisterCubit>().register();
                        },
                      ),
                    const SizedBox(height: 16),
                    AlreadyHaveAccountText(
                        text: 'Login',
                        onActionPressed: () {
                          GoRouter.of(context).push(Routes.kLoginView);
                        }),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
