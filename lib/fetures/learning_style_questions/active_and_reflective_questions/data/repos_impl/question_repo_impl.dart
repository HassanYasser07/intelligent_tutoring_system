// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/data/models/question_request_model.dart';
// import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/domain/repos/question_repo.dart';
//
// import '../../../../../core/errors/failures.dart';
// import '../api_services/questions_api_services.dart';
// import 'package:dartz/dartz.dart';
//
// class QuestionRepoImpl implements QuestionRepo {
//   final QuestionsApiServices _questionsApiServices;
//
//   QuestionRepoImpl(this._questionsApiServices);
//
//   @override
//   Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
//     print("Response:");
//     try {
//       var response = await _questionsApiServices.getQuestions();
//       print("Response: $response");
//       return right(response);
//     } catch (error) {
//       print(ServerFailure(error.toString()));
//       return left( ServerFailure(error.toString()) );
//     }
//   }
// }
//
