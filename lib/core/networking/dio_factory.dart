import 'package:dio/dio.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 100);
    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // addDioHeaders();
      // addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }
// static void addDioHeaders()async{
//   dio?.options.headers={
//     'Accept' : 'application/json',
//     "authorization" :'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKey.userToken)} '
//   };


// static void setTokenInHeaderAfterLogin(String token){
//   dio?.options.headers={
//     "authorization" :'Bearer $token '
//   };
// }
// static void addDioInterceptor(){
//   dio?.interceptors.add(
//       PrettyDioLogger(
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       )
//   );
// }
}