import 'package:intelligent_tutoring_system/fetures/learning_style_questions/data/models/question_request_model.dart';

abstract class QuestionState {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final String dimension;

  const QuestionLoaded(this.questions, this.dimension, {this.currentQuestionIndex = 0});

  @override
  List<Object> get props => [questions, currentQuestionIndex];

  QuestionLoaded copyWith({int? currentQuestionIndex}) {
    return QuestionLoaded(
      questions,
      dimension,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
}

class QuestionError extends QuestionState {
  final String message;
  const QuestionError(this.message);
  @override
  List<Object> get props => [message];
}
class QuestionResult extends QuestionState {
  final num activeReflectiveScore;
  final num visualVerbalScore;
  final num sensingIntuitiveScore;
  final num sequentialGlobalScore;


  const QuestionResult(this.activeReflectiveScore, this.visualVerbalScore, this.sensingIntuitiveScore, this.sequentialGlobalScore);

  @override
  List<Object> get props => [activeReflectiveScore, visualVerbalScore, sensingIntuitiveScore, sequentialGlobalScore];
}