import 'package:dio/dio.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

class RegisterRepository {
  final Dio dio;

  RegisterRepository(this.dio);

  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await dio.post(
        'https://graduation-learners-module-backend.vercel.app/api/learner',
        data: request.toJson(),
      );
      return RegisterResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to register: ${e.toString()}');
    }
  }
}

