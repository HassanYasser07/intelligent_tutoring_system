import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general%20widgets/app_text_buttom.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import 'package:intelligent_tutoring_system/core/theme/style.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/already_have_account.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/register/presentation/view/widgets/sign_up_form.dart';
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

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signup Successful'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Congratulations, you have signed up successfully!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              GoRouter.of(context)
                  .push(Routes.kCourseView); // Navigate to login
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
}

void setupErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: Styles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, // Just close the dialog
          child: Text(
            'Got it',
            style: Styles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
