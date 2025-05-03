import 'package:json_annotation/json_annotation.dart';
part 'user_knowledge_request_model.g.dart';

@JsonSerializable()
class UserKnowledgeRequestModel {
  @JsonKey(name: 'learner_email')
  final String learnerEmail;
  
  @JsonKey(name: 'learning_goals')
  final List<String> learningGoals;
  
  @JsonKey(name: 'knowledge_base')
  final List<String> knowledgeBase;

  UserKnowledgeRequestModel({
    required this.learnerEmail,
    required this.learningGoals,
    required this.knowledgeBase,
  });

  factory UserKnowledgeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserKnowledgeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserKnowledgeRequestModelToJson(this);
}