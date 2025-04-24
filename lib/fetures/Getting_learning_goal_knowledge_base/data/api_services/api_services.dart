import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/goal_and_knowledge_base_request_model.dart';
import '../models/goal_and_knowledge_base_response_model.dart';


part 'api_services.g.dart';

@RestApi(baseUrl: "https://iia-git-master-tarek-saads-projects.vercel.app/")
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @POST("/learning-analysis/analyze")
  Future<LearningAnalysisResponse> analyzeLearning(
    @Body() LearningAnalysisRequest request
  );
}


