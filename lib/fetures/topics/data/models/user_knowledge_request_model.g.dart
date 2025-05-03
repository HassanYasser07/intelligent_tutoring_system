// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_knowledge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserKnowledgeRequestModel _$UserKnowledgeRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserKnowledgeRequestModel(
      learnerEmail: json['learner_email'] as String,
      learningGoals: (json['learning_goals'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      knowledgeBase: (json['knowledge_base'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserKnowledgeRequestModelToJson(
        UserKnowledgeRequestModel instance) =>
    <String, dynamic>{
      'learner_email': instance.learnerEmail,
      'learning_goals': instance.learningGoals,
      'knowledge_base': instance.knowledgeBase,
    };
