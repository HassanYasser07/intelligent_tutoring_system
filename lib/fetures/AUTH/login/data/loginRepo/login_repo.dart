import 'package:dio/dio.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../../../../../core/helper/token_storage.dart';

class LoginRepository {
  final Dio dio;

  LoginRepository(this.dio);

  Future<LoginResponse> login(LoginRequestBody request) async {
    try {
      // Get token if exists
      final token = await AppStorage.getToken();
      
      final response = await dio.post(
        'https://graduation-learners-module-backend.vercel.app/api/login',
        data: request.toJson(),
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      
      final loginResponse = LoginResponse.fromJson(response.data);
      
      // Save the new token
      await AppStorage.saveToken(loginResponse.token);
      
      return loginResponse;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        // Token expired or invalid
        await AppStorage.deleteToken();
        throw Exception('Session expired. Please login again.');
      }
      throw Exception('Failed to login: ${e.toString()}');
    }
  }
}