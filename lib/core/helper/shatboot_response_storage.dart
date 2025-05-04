import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fetures/Getting_learning_goal_knowledge_base/data/models/goal_and_knowledge_base_response_model.dart';

class SharedPreferencesService {
  static const _keyLearningResponse = 'learning_analysis_response';

  Future<void> saveLearningAnalysisResponse(LearningAnalysisResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    final responseJson = jsonEncode(response.toJson());
    await prefs.setString(_keyLearningResponse, responseJson);
  }

  Future<LearningAnalysisResponse?> getLearningAnalysisResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final responseJson = prefs.getString(_keyLearningResponse);
    if (responseJson != null) {
      return LearningAnalysisResponse.fromJson(jsonDecode(responseJson));
    }
    return null;
  }

  Future<void> clearLearningAnalysisResponse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLearningResponse);
  }
}
