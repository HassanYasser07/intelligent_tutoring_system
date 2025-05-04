
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/profile_model.dart';
part 'profile_api_services.g.dart';


@RestApi(baseUrl: "https://graduation-learners-module-backend.vercel.app/api/")
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @GET("profile")
  Future<ProfileModel> getUserProfile(@Query("email") String email);
}


