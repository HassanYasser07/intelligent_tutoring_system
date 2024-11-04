


import 'package:dartz/dartz.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/data/models/question_request_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class QuestionRepo{
  Future<Either<Failure,List<QuestionModel>>> getQuestions();


}








