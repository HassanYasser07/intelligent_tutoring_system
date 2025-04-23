// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_and_knowledge_base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningAnalysisResponse _$LearningAnalysisResponseFromJson(
        Map<String, dynamic> json) =>
    LearningAnalysisResponse(
      knowledgeBase: (json['knowledge_base'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      learningGoal: (json['learning_goal'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LearningAnalysisResponseToJson(
        LearningAnalysisResponse instance) =>
    <String, dynamic>{
      'knowledge_base': instance.knowledgeBase,
      'learning_goal': instance.learningGoal,
    };
