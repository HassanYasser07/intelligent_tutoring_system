import 'package:dio/dio.dart';
import 'package:intelligent_tutoring_system/fetures/AUTH/login/data/models/token_verify_response.dart';

class TokenService {
  final Dio _dio;

  TokenService() : _dio = Dio();

  Future<TokenVerifyResponse> verifyToken(String token) async {
    try {
      final response = await _dio.get(
        'http://localhost:8080/api/verify-token',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      
      return TokenVerifyResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Invalid or expired token');
      }
      throw Exception('Failed to verify token: ${e.message}');
    }
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => message;
}