


import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../data/models/question_request_model.dart';

abstract class QuestionRepo{
  Future<Either<Failure,List<QuestionModel>>> getQuestions();


}








