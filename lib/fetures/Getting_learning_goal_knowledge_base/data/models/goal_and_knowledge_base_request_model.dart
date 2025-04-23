import 'package:json_annotation/json_annotation.dart';
part 'goal_and_knowledge_base_request_model.g.dart';

@JsonSerializable()
class LearningAnalysisRequest {
  @JsonKey(name: 'user_knowledge')
  final String userKnowledge;
  
  @JsonKey(name: 'user_goal')
  final String userGoal;

  LearningAnalysisRequest({
    required this.userKnowledge,
    required this.userGoal,
  });

  factory LearningAnalysisRequest.fromJson(Map<String, dynamic> json) => 
      _$LearningAnalysisRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LearningAnalysisRequestToJson(this);
}