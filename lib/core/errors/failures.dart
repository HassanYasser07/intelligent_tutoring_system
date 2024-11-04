import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    if (dioException.type case DioExceptionType.connectionTimeout) {
      return ServerFailure("Connection timeout with ApiServer");
    } else if (dioException.type case DioExceptionType.sendTimeout) {
      return ServerFailure('Send timeout with ApiServer');
    } else if (dioException.type case DioExceptionType.receiveTimeout) {
      return ServerFailure('Receive timeout with ApiServer');
    } else if (dioException.type case DioExceptionType.badResponse) {
      if (dioException.response != null && dioException.response!.statusCode != null) {
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      } else {
        return ServerFailure('Unexpected error: No response from server');
      }
    } else if (dioException.type case DioExceptionType.connectionError) {
      if (dioException.message != null && dioException.message!.contains('SocketException')) {
        return ServerFailure('No Internet Connection');
      }
    } else if (dioException.type case DioExceptionType.unknown) {
      return ServerFailure('Oops! There was an error. Please try again');
    } else if (dioException.type case DioExceptionType.badCertificate) {
      return ServerFailure('Bad SSL certificate detected');
    }
    return ServerFailure('Unexpected error');
  }

  factory ServerFailure.fromResponse(int stateCode, dynamic response) {
    if (stateCode == 400 || stateCode == 401 || stateCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (stateCode == 404) {
      return ServerFailure('Your request was not found, please try again.');
    } else if (stateCode == 500) {
      return ServerFailure('Internal server error, please try again.');
    } else {
      return ServerFailure('There was an error, please try again.');
    }
  }
}
