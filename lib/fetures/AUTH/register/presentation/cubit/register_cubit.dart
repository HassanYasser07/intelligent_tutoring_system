import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/core/helper/token_storage.dart';
import '../../data/models/register_request_model.dart';
import '../../data/repository/register_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repository;

  RegisterCubit(this.repository) : super(RegisterInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();
  final formKey = GlobalKey<FormState>();
  

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      // If form is not valid, return early without making the API call
      return;
    }
    
    emit(RegisterLoading());
    try {
      final request = RegisterRequestModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      final response = await repository.register(request);
          await AppStorage.saveToken(response.token);

      emit(RegisterSuccess(response.token));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}