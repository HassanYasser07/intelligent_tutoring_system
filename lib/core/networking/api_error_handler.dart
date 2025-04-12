import 'package:dio/dio.dart';
import 'package:intelligent_tutoring_system/core/errors/failures.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return ServerFailure.fromDioException(error);
    }
    return ServerFailure('Unexpected Error, Please try again!');
  }
}
