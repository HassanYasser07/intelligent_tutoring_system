import 'package:json_annotation/json_annotation.dart';

part 'goal_and_knowledge_base_response_model.g.dart';

@JsonSerializable()
class LearningAnalysisResponse {
  @JsonKey(name: 'knowledge_base')
  final List<String> knowledgeBase;
  
  @JsonKey(name: 'learning_goal')
  final List<String> learningGoal;

  LearningAnalysisResponse({
    required this.knowledgeBase,
    required this.learningGoal,
  });

  factory LearningAnalysisResponse.fromJson(Map<String, dynamic> json) => 
      _$LearningAnalysisResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LearningAnalysisResponseToJson(this);
}