import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/fetures/Getting_learning_goal_knowledge_base/presentation/cubit/shat_boot_state.dart';

import '../../data/repo/goal_and _knowledge_base_repo.dart';

class LearningAnalysisCubit extends Cubit<LearningAnalysisState> {
  final GoalAndKnowledgeBaseRepo _repo;

  LearningAnalysisCubit(this._repo) : super(LearningAnalysisInitial());

  Future<void> analyzeLearning(String userKnowledge, String userGoal) async {
    if (userKnowledge.isEmpty || userGoal.isEmpty) {
      emit(LearningAnalysisError('Please fill all fields'));
      return;
    }

    emit(LearningAnalysisLoading());
    try {
      final response = await _repo.analyzeLearning(userKnowledge, userGoal);
      emit(LearningAnalysisSuccess(
        knowledgeBase: response.knowledgeBase,
        learningGoal: response.learningGoal,
      ));
    } catch (e) {
      emit(LearningAnalysisError(e.toString()));
    }
  }
}