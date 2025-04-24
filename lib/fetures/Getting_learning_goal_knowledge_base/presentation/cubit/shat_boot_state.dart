abstract class LearningAnalysisState {}

class LearningAnalysisInitial extends LearningAnalysisState {}

class LearningAnalysisLoading extends LearningAnalysisState {}

class LearningAnalysisSuccess extends LearningAnalysisState {
  final List<String> knowledgeBase;
  final List<String> learningGoal;

  LearningAnalysisSuccess({
    required this.knowledgeBase,
    required this.learningGoal,
  });
}

class LearningAnalysisError extends LearningAnalysisState {
  final String message;

  LearningAnalysisError(this.message);
}