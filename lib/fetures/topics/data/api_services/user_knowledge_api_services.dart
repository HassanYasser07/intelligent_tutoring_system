import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_knowledge_request_model.dart';
import '../models/user_path_response_model.dart';

part 'user_knowledge_api_services.g.dart';
@RestApi(baseUrl: "https://iia-git-master-tarek-saads-projects.vercel.app/")
abstract class UserKnowledgeApiServices {
  factory UserKnowledgeApiServices(Dio dio, {String baseUrl}) = _UserKnowledgeApiServices;
  @POST("api/selection/best-path")
  Future<UserPathResponseModel> getBestPath(
    @Body() UserKnowledgeRequestModel request,
  );
}