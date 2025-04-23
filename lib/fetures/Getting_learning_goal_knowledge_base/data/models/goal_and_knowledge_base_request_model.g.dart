// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_and_knowledge_base_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningAnalysisRequest _$LearningAnalysisRequestFromJson(
        Map<String, dynamic> json) =>
    LearningAnalysisRequest(
      userKnowledge: json['user_knowledge'] as String,
      userGoal: json['user_goal'] as String,
    );

Map<String, dynamic> _$LearningAnalysisRequestToJson(
        LearningAnalysisRequest instance) =>
    <String, dynamic>{
      'user_knowledge': instance.userKnowledge,
      'user_goal': instance.userGoal,
    };
