import '../../../../../core/errors/failures.dart';
import '../api_services/questions_api_services.dart';
import 'package:dartz/dartz.dart';
import '../models/question_request_model.dart';

class QuestionRepoImpl   {
  final QuestionsApiServices _questionsApiServices;
  QuestionRepoImpl(this._questionsApiServices);
  Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
    try {
      var response = await _questionsApiServices.getQuestions();
      print("Response: $response");
      return right(response);
    } catch (error) {
      print("what is ////////////////////////////////   ${error.toString()}");
      print(ServerFailure(error.toString()));
      return left( ServerFailure(error.toString()) );
    }
  }
}

