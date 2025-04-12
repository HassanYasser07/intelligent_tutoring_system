import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/data/api_services/questions_api_constants.dart';
import 'package:retrofit/retrofit.dart';
import '../models/question_request_model.dart';
import '../models/result_model.dart';
part 'questions_api_services.g.dart';



@RestApi(baseUrl: QuestionApiConstants.baseUrl)

abstract class QuestionsApiServices {
  factory QuestionsApiServices(Dio dio) = _QuestionsApiServices;

  @GET(QuestionApiConstants.getQuestions)
  Future<List<QuestionModel>> getQuestions();

  @PATCH(QuestionApiConstants.updateLearningStyle)
  Future<void> updateLearningStyles(
      @Body() ResultModel result,
      @Header(QuestionApiConstants.headers) String token,
      );
}




