// part of 'questions_cubit.dart';
//
// @immutable
// sealed class QuestionsState {}
//
// final class QuestionsInitial extends QuestionsState {}
// final class QuestionsLoading extends QuestionsState {}
// final class QuestionsSuccess extends QuestionsState {
//   final List<QuestionModel> questions;
//
//   QuestionsSuccess(this.questions);
// }
// final class QuestionsFailure extends QuestionsState {
//   final String error; // إضافة متغير لرسالة الخطأ
//   QuestionsFailure(this.error);
// }

import '../../data/models/modeeeel.dart';

// abstract class QuestionsState {}
//
// class QuestionsInitial extends QuestionsState {}
//
// class QuestionsLoading extends QuestionsState {}
//
// class QuestionsSuccess extends QuestionsState {
//   final List<QuestionModell> questions;
//
//   QuestionsSuccess(this.questions, );
// }
//
// class QuestionsFailure extends QuestionsState {
//   final String error;
//
//   QuestionsFailure(this.error);
// }

abstract class QuestionState {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<QuestionModell> questions;
  final int currentQuestionIndex;

  const QuestionLoaded(this.questions, {this.currentQuestionIndex = 0});

  @override
  List<Object> get props => [questions, currentQuestionIndex];

  // دالة لتحديث المؤشر والانتقال إلى السؤال التالي
  QuestionLoaded copyWith({int? currentQuestionIndex}) {
    return QuestionLoaded(
      questions,
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
  final int activeScore;
  final int reflectiveScore;

  const QuestionResult(this.activeScore, this.reflectiveScore);

  @override
  List<Object> get props => [activeScore, reflectiveScore];
}