import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/helper/token_storage.dart';
import 'package:intelligent_tutoring_system/core/routing/routing.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/data/loginRepo/login_repo.dart';
import '../../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  Future<void> checkToken(BuildContext context) async {
    final token = await AppStorage.getToken();
    if (token == null) {
      context.go(Routes.kRegisterView);
    }
  }

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    emit(LoginLoading());
    try {
      final request = LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      );
      final response = await repository.login(request);
      await AppStorage.saveToken(response.token);
      emit(LoginSuccess(response.token));
      
      if (context.mounted) {
        context.go(Routes.kCourseView);
      }
    } catch (e) {
      if (e.toString().contains('Session expired')) {
        if (context.mounted) {
          context.go(Routes.kLoginView);
        }
      }
      emit(LoginError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}