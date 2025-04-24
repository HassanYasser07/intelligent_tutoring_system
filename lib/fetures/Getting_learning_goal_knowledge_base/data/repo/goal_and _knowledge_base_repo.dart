
import '../api_services/api_services.dart';
import '../models/goal_and_knowledge_base_request_model.dart';
import '../models/goal_and_knowledge_base_response_model.dart';

class GoalAndKnowledgeBaseRepo {
  final ApiServices _apiServices;

  GoalAndKnowledgeBaseRepo(this._apiServices);

  Future<LearningAnalysisResponse> analyzeLearning(
    String userKnowledge, 
    String userGoal
  ) async {
    final request = LearningAnalysisRequest(
      userKnowledge: userKnowledge,
      userGoal: userGoal,
    );
    return await _apiServices.analyzeLearning(request);
  }
}